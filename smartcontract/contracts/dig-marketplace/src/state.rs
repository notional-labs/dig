use crate::package::ContractInfoResponse;
use cosmwasm_std::{Addr, StdResult, Storage, Timestamp, Uint128};
use cw_storage_plus::{Item, Map};
use schemars::JsonSchema;
use serde::{Deserialize, Serialize};
use dig::cw721::RoyaltyInfoResponse;

pub static CONFIG_KEY: &str = "config";

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, JsonSchema)]
pub struct Offering {
    pub token_id: String,
    pub contract_addr: Addr,
    pub royalty_info: Option<RoyaltyInfoResponse>,
    pub seller: Addr,
    pub list_price: Uint128,
    pub listing_time: Timestamp,
}

pub const OFFERINGS: Map<&str, Offering> = Map::new("offerings");
pub const OFFERINGS_COUNT: Item<u64> = Item::new("num_offerings");
pub const CONTRACT_INFO: Item<ContractInfoResponse> = Item::new("marketplace_info");

pub fn num_offerings(storage: &dyn Storage) -> StdResult<u64> {
    Ok(OFFERINGS_COUNT.may_load(storage)?.unwrap_or_default())
}

pub fn increment_offerings(storage: &mut dyn Storage) -> StdResult<u64> {
    let val = num_offerings(storage)? + 1;
    OFFERINGS_COUNT.save(storage, &val)?;

    Ok(val)
}