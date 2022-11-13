use std::cmp::Ordering;
use std::str::from_utf8;
use std::vec;

#[cfg(not(feature = "library"))]
use cosmwasm_std::entry_point;
use cosmwasm_std::{
    coin, from_binary, to_binary, Api, BankMsg, Binary, Coin, CosmosMsg, Deps, DepsMut, Env,
    MessageInfo, Order, Record, Response, StdError, StdResult, Uint128, WasmMsg,
};

use dig::cw721::{CollectionInfoResponse, QueryMsg as an721QueryMsg};
use cw2::set_contract_version;
use cw721::{Cw721ExecuteMsg, Cw721ReceiveMsg};

use crate::error::ContractError;
use crate::msg::{ExecuteMsg, InstantiateMsg, QueryMsg, SellNft};
use crate::package::{ContractInfoResponse, OfferingsResponse, QueryOfferingsResult};
use crate::state::{increment_offerings, Offering, CONTRACT_INFO, OFFERINGS};

// version info for migration info
const CONTRACT_NAME: &str = "crates.io:digcw721-nft-marketplace";
const CONTRACT_VERSION: &str = env!("CARGO_PKG_VERSION");


#[cfg_attr(not(feature = "library"), entry_point)]
pub fn instantiate(
    deps: DepsMut,
    _env: Env,
    _info: MessageInfo,
    msg: InstantiateMsg,
) -> Result<Response, ContractError> {
    let info = ContractInfoResponse { name: msg.name, native_denom: msg.native_denom};

    CONTRACT_INFO.save(deps.storage, &info)?;
    set_contract_version(deps.storage, CONTRACT_NAME, CONTRACT_VERSION)?;

    Ok(Response::new()
        .add_attribute("action", "instantiate")
        .add_attribute("name", info.name))
}

#[cfg_attr(not(feature = "library"), entry_point)]
pub fn execute(
    deps: DepsMut,
    env: Env,
    info: MessageInfo,
    msg: ExecuteMsg,
) -> Result<Response, ContractError> {
    match msg {
        ExecuteMsg::WithdrawNft { offering_id } => {
            execute_cancel_sale(deps, env, info, offering_id)
        }
        ExecuteMsg::MakeOrder { offering_id } => execute_make_order(deps, env, info, offering_id),
        ExecuteMsg::ReceiveNft(msg) => execute_create_sale(deps, env, info, msg),
        ExecuteMsg::UpdatePrice {
            offering_id,
            update_price,
        } => execute_update_price(deps, env, info, offering_id, update_price),
    }
}

/// If exactly one coin was sent, returns it regardless of denom.
/// Returns error if 0 or 2+ coins were sent
pub fn one_coin(info: &MessageInfo) -> Result<Coin, ContractError> {
    match info.funds.len() {
        0 => Err(ContractError::NoFunds {}),
        1 => {
            let coin = &info.funds[0];
            if coin.amount.is_zero() {
                Err(ContractError::NoFunds {})
            } else {
                Ok(coin.clone())
            }
        }
        _ => Err(ContractError::MultipleDenoms {}),
    }
}

pub fn execute_make_order(
    deps: DepsMut,
    _env: Env,
    info: MessageInfo,
    offering_id: String,
) -> Result<Response, ContractError> {
    let off = OFFERINGS.load(deps.storage, &offering_id)?;

    let royalty_info = off.royalty_info;

    
  

    // check funds have just one denom
    let check_price = one_coin(&info)?;

    // check denom is uan1
    let native_denom = get_native_denom(deps.as_ref());
    if check_price.denom != native_denom{
        return Err(ContractError::WrongDenoms {});
    }
    // check for enough coins
    let funds_from_sender = check_price;

    if funds_from_sender.amount < off.list_price {
        return Err(ContractError::InsufficientFunds {});
    }
    
    let mut cosmos_msg:Vec<CosmosMsg> = vec![];

    let royalty_fee;
    let net_price;
    if royalty_info.is_some() {
        let creator_address = royalty_info.clone().unwrap().payment_address;
        let share = royalty_info.unwrap().share;

        royalty_fee = funds_from_sender.amount * share;
        net_price = funds_from_sender.amount - funds_from_sender.amount * share;

            // send price to creator
        let transfer_royalty_fee_msg = CosmosMsg::Bank(BankMsg::Send {
            to_address: creator_address,
            amount: vec![coin(royalty_fee.u128(), native_denom.clone())],
        });

        cosmos_msg.push(transfer_royalty_fee_msg);
    
    }else {
        royalty_fee = Uint128::from(0u128);
        net_price = funds_from_sender.amount;
    }
    
   
    // create transfer cw721 msg
    let transfer_cw721_msg = Cw721ExecuteMsg::TransferNft {
        recipient: info.sender.clone().into_string(),
        token_id: off.token_id.clone(),
    };

    let exec_cw721_transfer = WasmMsg::Execute {
        contract_addr: (&off.contract_addr).to_string(),
        msg: to_binary(&transfer_cw721_msg)?,
        funds: vec![],
    };
    
    // send price to seller
    let transfer_net_price_msg = CosmosMsg::Bank(BankMsg::Send {
        to_address: (&off.seller).to_string(),
        amount: vec![coin(net_price.u128(), native_denom.clone())],
    });

    // transfer nft to buyer
    let cw721_transfer_cosmos_msg: CosmosMsg = exec_cw721_transfer.into();

    cosmos_msg.push(transfer_net_price_msg);
    cosmos_msg.push(cw721_transfer_cosmos_msg);
   
    //delete offering
    OFFERINGS.remove(deps.storage, &offering_id);

    let price_string = format!("{} {}", off.list_price.clone(), native_denom);

    Ok(Response::new()
        .add_messages(cosmos_msg)
        .add_attribute("action", "make_order")
        .add_attribute("seller", off.seller.to_string())
        .add_attribute("buyer", info.sender)
        .add_attribute("paid_price", price_string)
        .add_attribute("token_id", off.token_id)
        .add_attribute("contract_addr", off.contract_addr.to_string())
        .add_attribute("net_price", net_price)
        .add_attribute("royalty_fee", royalty_fee))
}

pub fn execute_create_sale(
    deps: DepsMut,
    env: Env,
    info: MessageInfo,
    rcv_msg: Cw721ReceiveMsg,
) -> Result<Response, ContractError> {
    let msg: SellNft = from_binary(&rcv_msg.msg)?;

    // get OFFERING_COUNT
    let id = increment_offerings(deps.storage)?.to_string();

    // query collection info
    let collection_info: CollectionInfoResponse = deps
        .querier
        .query_wasm_smart(info.sender.clone(), &an721QueryMsg::CollectionInfo {})?;

    let royalty_info = collection_info.royalty_info;

    if msg.list_price.is_zero() {
        return Err(ContractError::PriceMustBePosiTive {});
    }
    // save Offering
    let off = Offering {
        contract_addr: info.sender.clone(),
        royalty_info: royalty_info.clone(),
        token_id: rcv_msg.token_id.clone(),
        seller: deps.api.addr_validate(&rcv_msg.sender.clone())?,
        list_price: msg.list_price.clone(),
        listing_time: env.block.time,
    };

    OFFERINGS.save(deps.storage, &id, &off)?;

    let native_denom = get_native_denom(deps.as_ref());
    let price_string = format!("{} {}", msg.list_price, native_denom);

    let royalty_info_string;
    if royalty_info.is_some(){
        royalty_info_string = format!(
            "{} {}",
            royalty_info.clone().unwrap().payment_address,
            royalty_info.unwrap().share
        );
    }else {
        royalty_info_string = "None".to_string();
    }
  

    Ok(Response::new()
        .add_attribute("action", "create_sale")
        .add_attribute("original_contract", info.sender)
        .add_attribute("royalty_info", royalty_info_string)
        .add_attribute("seller", off.seller.to_string())
        .add_attribute("list_price", price_string)
        .add_attribute("token_id", off.token_id))
}

pub fn execute_cancel_sale(
    deps: DepsMut,
    _env: Env,
    info: MessageInfo,
    offering_id: String,
) -> Result<Response, ContractError> {
    // check if token_id is currently sold by the requesting address
    let off = OFFERINGS.load(deps.storage, &offering_id)?;
    if off.seller == info.sender {
        // transfer token back to original owner
        let transfer_cw721_msg = Cw721ExecuteMsg::TransferNft {
            recipient: off.seller.clone().into_string(),
            token_id: off.token_id.clone(),
        };

        let exec_cw721_transfer = WasmMsg::Execute {
            contract_addr: off.contract_addr.clone().into_string(),
            msg: to_binary(&transfer_cw721_msg)?,
            funds: vec![],
        };

        let cw721_transfer_cosmos_msg: Vec<CosmosMsg> = vec![exec_cw721_transfer.into()];

        // remove offering
        OFFERINGS.remove(deps.storage, &offering_id);

        return Ok(Response::new()
            .add_messages(cw721_transfer_cosmos_msg)
            .add_attribute("action", "cancel_sale")
            .add_attribute("seller", info.sender)
            .add_attribute("offering_id", offering_id));
    }
    Err(ContractError::Unauthorized {})
}

pub fn execute_update_price(
    deps: DepsMut,
    _env: Env,
    info: MessageInfo,
    offering_id: String,
    update_price: Uint128,
) -> Result<Response, ContractError> {
    // check if token_id is currently sold by the requesting address
    let mut off = OFFERINGS.load(deps.storage, &offering_id)?;
    if info.sender != off.seller {
        return Err(ContractError::Unauthorized {});
    }
    if update_price.is_zero() {
        return Err(ContractError::PriceMustBePosiTive {});
    }
    off.list_price = update_price;
    OFFERINGS.save(deps.storage, &offering_id, &off)?;

    let native_denom = get_native_denom(deps.as_ref());
    let price_string = format!("{} {}", off.list_price, native_denom);

    Ok(Response::new()
        .add_attribute("action", "update_price")
        .add_attribute("sender", info.sender)
        .add_attribute("offering_id", offering_id)
        .add_attribute("update_price", price_string))
}


fn get_native_denom(deps: Deps) -> String {
    let config = CONTRACT_INFO.load(deps.storage).unwrap();
    config.native_denom
}
#[cfg_attr(not(feature = "library"), entry_point)]
pub fn query(deps: Deps, _env: Env, msg: QueryMsg) -> StdResult<Binary> {
    match msg {
        QueryMsg::GetOfferings { sort_listing } => {
            to_binary(&query_offerings(deps, &sort_listing)?)
        }
        QueryMsg::GetOfferingsByPriceRange {
            min,
            max,
            sort_listing,
        } => to_binary(&query_offerings_by_price_range(
            deps,
            min,
            max,
            &sort_listing,
        )?),
        QueryMsg::GetOfferingsOfCollection {
            contract_addr,
            sort_listing,
        } => to_binary(&query_offerings_of_collection(
            deps,
            &contract_addr,
            &sort_listing,
        )?),
        QueryMsg::GetOfferingsOfSeller {
            seller,
            sort_listing,
        } => to_binary(&query_offerings_of_seller(deps, &seller, &sort_listing)?),
    }
}

fn query_offerings(deps: Deps, sort_listing: &str) -> StdResult<OfferingsResponse> {
    let res: StdResult<Vec<QueryOfferingsResult>> = OFFERINGS
        .range_raw(deps.storage, None, None, Order::Ascending)
        .map(|kv_item| parse_offering(deps.api, kv_item))
        .collect();

    let mut offerings_clone = res?.clone();

    if offerings_clone.len() == 0 {
        return Ok(OfferingsResponse {
            offerings: offerings_clone,
        });
    }

    match sort_listing {
        "price_lowest" => {
            offerings_clone.sort_by(|a, b| {
                if a.list_price < b.list_price {
                    Ordering::Less
                } else if a.list_price == b.list_price {
                    Ordering::Equal
                } else {
                    Ordering::Greater
                }
            });

            Ok(OfferingsResponse {
                offerings: offerings_clone,
            })
        }
        "price_highest" => {
            offerings_clone.sort_by(|a, b| {
                if a.list_price < b.list_price {
                    Ordering::Greater
                } else if a.list_price == b.list_price {
                    Ordering::Equal
                } else {
                    Ordering::Less
                }
            });

            Ok(OfferingsResponse {
                offerings: offerings_clone,
            })
        }
        "newest_listed" => {
            offerings_clone.sort_by(|a, b| {
                let a_id: u128 = a.id.parse().unwrap();
                let b_id: u128 = b.id.parse().unwrap();

                if a_id < b_id {
                    Ordering::Less
                } else if a_id == b_id {
                    Ordering::Equal
                } else {
                    Ordering::Greater
                }
            });

            Ok(OfferingsResponse {
                offerings: offerings_clone,
            })
        }
        "oldest_listed" => {
            offerings_clone.sort_by(|a, b| {
                let a_id: u128 = a.id.parse().unwrap();
                let b_id: u128 = b.id.parse().unwrap();

                if a_id < b_id {
                    Ordering::Greater
                } else if a_id == b_id {
                    Ordering::Equal
                } else {
                    Ordering::Less
                }
            });

            Ok(OfferingsResponse {
                offerings: offerings_clone,
            })
        }

        _ => Err(StdError::NotFound {
            kind: "Sort must be one of (price_lowest, price_highest, newest_listed, oldest_listed)"
                .to_string(),
        }),
    }
}

fn query_offerings_by_price_range(
    deps: Deps,
    min: Uint128,
    max: Uint128,
    sort_listing: &str,
) -> StdResult<OfferingsResponse> {
    let res: StdResult<Vec<QueryOfferingsResult>> = OFFERINGS
        .range_raw(deps.storage, None, None, Order::Ascending)
        .map(|kv_item| parse_offering(deps.api, kv_item))
        .collect();

    let offerings_clone = res?.clone();

    if offerings_clone.len() == 0 {
        return Ok(OfferingsResponse {
            offerings: offerings_clone,
        });
    }

    let mut result: Vec<QueryOfferingsResult> = offerings_clone
        .into_iter()
        .filter(|x| x.list_price >= min && x.list_price <= max)
        .collect();

    let result_clone = result.clone();

    if result_clone.len() == 0 {
        return Ok(OfferingsResponse {
            offerings: result_clone,
        });
    }
    match sort_listing {
        "price_lowest" => {
            result.sort_by(|a, b| {
                if a.list_price < b.list_price {
                    Ordering::Less
                } else if a.list_price == b.list_price {
                    Ordering::Equal
                } else {
                    Ordering::Greater
                }
            });

            Ok(OfferingsResponse { offerings: result })
        }
        "price_highest" => {
            result.sort_by(|a, b| {
                if a.list_price < b.list_price {
                    Ordering::Greater
                } else if a.list_price == b.list_price {
                    Ordering::Equal
                } else {
                    Ordering::Less
                }
            });

            Ok(OfferingsResponse { offerings: result })
        }
        "newest_listed" => {
            result.sort_by(|a, b| {
                let a_id: u128 = a.id.parse().unwrap();
                let b_id: u128 = b.id.parse().unwrap();

                if a_id < b_id {
                    Ordering::Less
                } else if a_id == b_id {
                    Ordering::Equal
                } else {
                    Ordering::Greater
                }
            });

            Ok(OfferingsResponse { offerings: result })
        }
        "oldest_listed" => {
            result.sort_by(|a, b| {
                let a_id: u128 = a.id.parse().unwrap();
                let b_id: u128 = b.id.parse().unwrap();

                if a_id < b_id {
                    Ordering::Greater
                } else if a_id == b_id {
                    Ordering::Equal
                } else {
                    Ordering::Less
                }
            });

            Ok(OfferingsResponse { offerings: result })
        }

        _ => Err(StdError::NotFound {
            kind: "Sort must be one of (price_lowest, price_highest, newest_listed, oldest_listed)"
                .to_string(),
        }),
    }
}

fn query_offerings_of_collection(
    deps: Deps,
    contract_addr: &str,
    sort_listing: &str,
) -> StdResult<OfferingsResponse> {
    let res: StdResult<Vec<QueryOfferingsResult>> = OFFERINGS
        .range_raw(deps.storage, None, None, Order::Ascending)
        .map(|kv_item| parse_offering(deps.api, kv_item))
        .collect();

    let offerings_clone = res?.clone();

    if offerings_clone.len() == 0 {
        return Ok(OfferingsResponse {
            offerings: offerings_clone,
        });
    }

    let mut result: Vec<QueryOfferingsResult> = offerings_clone
        .into_iter()
        .filter(|x| x.contract_addr == contract_addr)
        .collect();

    let result_clone = result.clone();

    if result_clone.len() == 0 {
        return Ok(OfferingsResponse {
            offerings: result_clone,
        });
    }
    match sort_listing {
        "price_lowest" => {
            result.sort_by(|a, b| {
                if a.list_price < b.list_price {
                    Ordering::Less
                } else if a.list_price == b.list_price {
                    Ordering::Equal
                } else {
                    Ordering::Greater
                }
            });

            Ok(OfferingsResponse { offerings: result })
        }
        "price_highest" => {
            result.sort_by(|a, b| {
                if a.list_price < b.list_price {
                    Ordering::Greater
                } else if a.list_price == b.list_price {
                    Ordering::Equal
                } else {
                    Ordering::Less
                }
            });

            Ok(OfferingsResponse { offerings: result })
        }
        "newest_listed" => {
            result.sort_by(|a, b| {
                let a_id: u128 = a.id.parse().unwrap();
                let b_id: u128 = b.id.parse().unwrap();

                if a_id < b_id {
                    Ordering::Less
                } else if a_id == b_id {
                    Ordering::Equal
                } else {
                    Ordering::Greater
                }
            });

            Ok(OfferingsResponse { offerings: result })
        }
        "oldest_listed" => {
            result.sort_by(|a, b| {
                let a_id: u128 = a.id.parse().unwrap();
                let b_id: u128 = b.id.parse().unwrap();

                if a_id < b_id {
                    Ordering::Greater
                } else if a_id == b_id {
                    Ordering::Equal
                } else {
                    Ordering::Less
                }
            });

            Ok(OfferingsResponse { offerings: result })
        }

        _ => Err(StdError::NotFound {
            kind: "Sort must be one of (price_lowest, price_highest, newest_listed, oldest_listed)"
                .to_string(),
        }),
    }
}

fn query_offerings_of_seller(
    deps: Deps,
    seller: &str,
    sort_listing: &str,
) -> StdResult<OfferingsResponse> {
    let res: StdResult<Vec<QueryOfferingsResult>> = OFFERINGS
        .range_raw(deps.storage, None, None, Order::Ascending)
        .map(|kv_item| parse_offering(deps.api, kv_item))
        .collect();

    let offerings_clone = res?.clone();

    if offerings_clone.len() == 0 {
        return Ok(OfferingsResponse {
            offerings: offerings_clone,
        });
    }

    let mut result: Vec<QueryOfferingsResult> = offerings_clone
        .into_iter()
        .filter(|x| x.seller == seller)
        .collect();

    let result_clone = result.clone();

    if result_clone.len() == 0 {
        return Ok(OfferingsResponse {
            offerings: result_clone,
        });
    }
    match sort_listing {
        "price_lowest" => {
            result.sort_by(|a, b| {
                if a.list_price < b.list_price {
                    Ordering::Less
                } else if a.list_price == b.list_price {
                    Ordering::Equal
                } else {
                    Ordering::Greater
                }
            });

            Ok(OfferingsResponse { offerings: result })
        }
        "price_highest" => {
            result.sort_by(|a, b| {
                if a.list_price < b.list_price {
                    Ordering::Greater
                } else if a.list_price == b.list_price {
                    Ordering::Equal
                } else {
                    Ordering::Less
                }
            });

            Ok(OfferingsResponse { offerings: result })
        }
        "newest_listed" => {
            result.sort_by(|a, b| {
                let a_id: u128 = a.id.parse().unwrap();
                let b_id: u128 = b.id.parse().unwrap();

                if a_id < b_id {
                    Ordering::Less
                } else if a_id == b_id {
                    Ordering::Equal
                } else {
                    Ordering::Greater
                }
            });

            Ok(OfferingsResponse { offerings: result })
        }
        "oldest_listed" => {
            result.sort_by(|a, b| {
                let a_id: u128 = a.id.parse().unwrap();
                let b_id: u128 = b.id.parse().unwrap();

                if a_id < b_id {
                    Ordering::Greater
                } else if a_id == b_id {
                    Ordering::Equal
                } else {
                    Ordering::Less
                }
            });

            Ok(OfferingsResponse { offerings: result })
        }

        _ => Err(StdError::NotFound {
            kind: "Sort must be one of (price_lowest, price_highest, newest_listed, oldest_listed)"
                .to_string(),
        }),
    }
}

fn parse_offering(
    _api: &dyn Api,
    item: StdResult<Record<Offering>>,
) -> StdResult<QueryOfferingsResult> {
    item.and_then(|(k, offering)| {
        let id = from_utf8(&k)?;
        Ok(QueryOfferingsResult {
            id: id.to_string(),
            token_id: offering.token_id,
            list_price: offering.list_price,
            royalty_info: offering.royalty_info,
            contract_addr: offering.contract_addr.clone().into_string(),
            seller: offering.seller.clone().into_string(),
            listing_time: offering.listing_time,
        })
    })
}

#[cfg(test)]
mod tests {
    use crate::contract::instantiate;
    use crate::msg::InstantiateMsg;
    use cosmwasm_std::attr;
    use cosmwasm_std::testing::{mock_dependencies, mock_env, mock_info};

    pub const ADDR1: &str = "ADDR1";
    #[test]
    fn test_instantiate() {
        let mut deps = mock_dependencies();
        let env = mock_env();
        let info = mock_info(ADDR1, &[]);
        let msg = InstantiateMsg {
            name: "Dig NFT Marketplace".to_string(),
            native_denom: "junox".to_string()
        };
        // Call instantiate, unwrap to assert success
        let res = instantiate(deps.as_mut(), env, info, msg).unwrap();

        assert_eq!(
            res.attributes,
            vec![
                attr("action", "instantiate"),
                attr("name", "Dig NFT Marketplace")
            ]
        )
    }
}
