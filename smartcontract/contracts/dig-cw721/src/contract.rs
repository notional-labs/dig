
use serde::de::DeserializeOwned;
use serde::Serialize;

use cosmwasm_std::{Binary, Deps, DepsMut, Env, MessageInfo, Response};

use cw2::set_contract_version;
use cw721::{CustomMsg, Cw721Execute, Cw721ReceiveMsg, Expiration};
use url::Url;

use dig::errors::{CW721Error};
use dig::cw721::{InstantiateMsg, RoyaltyInfo, CollectionInfo, RoyaltyInfoResponse};
use crate::msg::{
    ContractInfoResponse, CreateModelMsg, ExecuteMsg, MintMsg,
};
use crate::state::{
    AnoneCw721Contract, Approval, ModelInfo, TokenInfo, TokenStatus,
    COLLECTION_INFO,
};



// version info for migration info
const CONTRACT_NAME: &str = "crates.io:anone-cw721";
const CONTRACT_VERSION: &str = env!("CARGO_PKG_VERSION");
const MAX_DESCRIPTION_LENGTH: u32 = 512;

impl<'a, T, C> AnoneCw721Contract<'a, T, C>
where
    T: Serialize + DeserializeOwned + Clone,
    C: CustomMsg,
{
    pub fn instantiate(
        &self,
        deps: DepsMut,
        _env: Env,
        _info: MessageInfo,
        msg: InstantiateMsg,
    ) -> Result<Response<C>, CW721Error> {
        set_contract_version(deps.storage, CONTRACT_NAME, CONTRACT_VERSION)?;

        let info = ContractInfoResponse {
            name: msg.name,
            symbol: msg.symbol,
        };
        self.contract_info.save(deps.storage, &info)?;
        let minter = deps.api.addr_validate(&msg.minter)?;
        self.minter.save(deps.storage, &minter)?;
        // anone-cw721 instantiation
        if msg.collection_info.description.len() > MAX_DESCRIPTION_LENGTH as usize {
            return Err(CW721Error::DescriptionTooLong {});
        }

        let image = Url::parse(&msg.collection_info.image)?;
        if image.scheme() != "ipfs" {
            return Err(CW721Error::InvalidBaseURI {});
        }

        if let Some(ref external_link) = msg.collection_info.external_link {
            Url::parse(external_link)?;
        }

        let royalty_info: Option<RoyaltyInfo> = match msg.collection_info.royalty_info {
            Some(royalty_info) => Some(RoyaltyInfo {
                payment_address: deps.api.addr_validate(&royalty_info.payment_address)?,
                share: royalty_info.share_validate()?,
            }),
            None => None,
        };

        deps.api.addr_validate(&msg.collection_info.creator)?;

        let collection_info = CollectionInfo {
            creator: msg.collection_info.creator,
            description: msg.collection_info.description,
            image: msg.collection_info.image,
            external_link: msg.collection_info.external_link,
            royalty_info,
        };

        COLLECTION_INFO.save(deps.storage, &collection_info)?;

        Ok(Response::default()
            .add_attribute("action", "instantiate")
            .add_attribute("contract_name", CONTRACT_NAME)
            .add_attribute("contract_version", CONTRACT_VERSION)
            .add_attribute("image", image.to_string()))
    }

    pub fn execute(
        &self,
        deps: DepsMut,
        env: Env,
        info: MessageInfo,
        msg: ExecuteMsg<T>,
    ) -> Result<Response<C>, CW721Error> {
        match msg {
            ExecuteMsg::Mint(msg) => self.mint(deps, env, info, msg),
            ExecuteMsg::CreateModel(msg) => self.create_model(deps, env, info, msg),
            ExecuteMsg::Approve {
                spender,
                token_id,
                expires,
            } => self.approve(deps, env, info, spender, token_id, expires),
            ExecuteMsg::Revoke { spender, token_id } => {
                self.revoke(deps, env, info, spender, token_id)
            }
            ExecuteMsg::ApproveAll { operator, expires } => {
                self.approve_all(deps, env, info, operator, expires)
            }
            ExecuteMsg::RevokeAll { operator } => self.revoke_all(deps, env, info, operator),
            ExecuteMsg::TransferNft {
                recipient,
                token_id,
            } => self.transfer_nft(deps, env, info, recipient, token_id),
            ExecuteMsg::SendNft {
                contract,
                token_id,
                msg,
            } => self.send_nft(deps, env, info, contract, token_id, msg),
            ExecuteMsg::Burn { token_id } => self.burn(deps, env, info, token_id),
            ExecuteMsg::ModifyCollectionInfo {
                description,
                image,
                external_link,
                royalty_info,
            } => self.modify_collection_info(
                deps,
                env,
                info,
                description,
                image,
                external_link,
                royalty_info,
            ),
        }
    }
}

// TODO pull this into some sort of trait extension??
impl<'a, T, C> AnoneCw721Contract<'a, T, C>
where
    T: Serialize + DeserializeOwned + Clone,
    C: CustomMsg,
{
    pub fn mint(
        &self,
        deps: DepsMut,
        _env: Env,
        info: MessageInfo,
        msg: MintMsg<T>,
    ) -> Result<Response<C>, CW721Error> {
        let minter = self.minter.load(deps.storage)?;

        if info.sender != minter {
            return Err(CW721Error::Unauthorized {});
        }

        // Todo: read index map
        // if !self.models.has(deps.storage, &msg.model_id) {
        //     return Err(CW721Error::ModelNotExisted { });
        // }

        let mut model = self.models.load(deps.storage, &msg.model_id)?;
        model.current_supply += 1;

        if model.current_supply > model.suppy_limit {
            return  Err(CW721Error::MaxModelSupplyExceeded {});
        }
        self.models.save(deps.storage, &msg.model_id, &model)?;

        // create the token
        let token = TokenInfo {
            token_id: msg.token_id.clone(),
            owner: deps.api.addr_validate(&msg.owner)?,
            approvals: vec![],
            model_id: msg.model_id,
            token_uri: model.model_uri,
            status: TokenStatus::NotListing,
            extension: msg.extension,
        };

        self.tokens
            .update(deps.storage, &msg.token_id, |old| match old {
                Some(_) => Err(CW721Error::Claimed {}),
                None => Ok(token),
            })?;

        self.increment_tokens(deps.storage)?;

        Ok(Response::new()
            .add_attribute("action", "mint")
            .add_attribute("minter", info.sender)
            .add_attribute("token_id", msg.token_id))
    }
}

impl<'a, T, C> AnoneCw721Contract<'a, T, C>
where
    T: Serialize + DeserializeOwned + Clone,
    C: CustomMsg,
{
    pub fn create_model(
        &self,
        deps: DepsMut,
        _env: Env,
        info: MessageInfo,
        msg: CreateModelMsg<T>,
    ) -> Result<Response<C>, CW721Error> {
        let minter = self.minter.load(deps.storage)?;

        if info.sender != minter {
            return Err(CW721Error::Unauthorized {});
        }
        
        // Todo: Read field on generic input

        let model_uri = Url::parse(&msg.model_uri)?;
        if model_uri.scheme() != "ipfs" {
            return Err(CW721Error::InvalidBaseURI {});
        }

        // create the shoe model
        let model = ModelInfo {
            model_id: msg.model_id.clone(),
            owner: deps.api.addr_validate(&msg.owner)?,
            model_uri: model_uri.to_string(),
            suppy_limit: msg.supply_limit,
            current_supply: 0u64,
            extension: msg.extension,
        };
        self.models
            .update(deps.storage, &msg.model_id, |old| match old {
                Some(_) => Err(CW721Error::ModelClaimed {}),
                None => Ok(model),
            })?;

        self.increment_models(deps.storage)?;

        Ok(Response::new()
            .add_attribute("action", "mint")
            .add_attribute("minter", info.sender)
            .add_attribute("model_id", msg.model_id))
    }
}

impl<'a, T, C> AnoneCw721Contract<'a, T, C>
where
    T: Serialize + DeserializeOwned + Clone,
    C: CustomMsg,
{
    pub fn modify_collection_info(
        &self,
        deps: DepsMut,
        _env: Env,
        info: MessageInfo,
        description: Option<String>,
        image: Option<String>,
        external_link: Option<String>,
        royalty_info: Option<RoyaltyInfoResponse>,
    ) -> Result<Response<C>, CW721Error> {
        let mut collection_info = COLLECTION_INFO.load(deps.storage)?;
        let minter = self.minter.load(deps.storage)?;
        if info.sender != minter {
            return Err(CW721Error::Unauthorized {});
        }

        if let Some(i) = description.clone() {
            collection_info.description = i;
        }

        if let Some(i) = image.clone() {
            let image_url = Url::parse(&i)?;
            if image_url.scheme() != "ipfs" {
                return Err(CW721Error::InvalidBaseURI {});
            }
            collection_info.image = i;
        }

        let modify_royalty_info: Option<RoyaltyInfo> = match royalty_info {
            Some(royalty_info) => Some(RoyaltyInfo {
                payment_address: deps.api.addr_validate(&royalty_info.payment_address)?,
                share: royalty_info.share_validate()?,
            }),
            None => None,
        };

        collection_info.external_link = external_link.clone();
        collection_info.royalty_info = modify_royalty_info.clone();

        COLLECTION_INFO.save(deps.storage, &collection_info)?;

        let null_string = String::new();

        let unwrap_external_link = external_link.unwrap_or(null_string.clone());
        let unwrap_description = description.unwrap_or(null_string.clone());
        let unwrap_image = image.unwrap_or(null_string.clone());
        let modify_royalty_info_clone = modify_royalty_info.clone();

        let modify_royalty_info_string = format!(
            "{} {}",
            modify_royalty_info_clone.unwrap().payment_address,
            modify_royalty_info.unwrap().share
        );

        Ok(Response::new()
            .add_attribute("action", "modify_collection_info")
            .add_attribute("minter", info.sender)
            .add_attribute("new_description", unwrap_description)
            .add_attribute("new_image", unwrap_image)
            .add_attribute("new_external_link", unwrap_external_link)
            .add_attribute("new_royalty_info", modify_royalty_info_string))
    }
}

impl<'a, T, C> Cw721Execute<T, C> for AnoneCw721Contract<'a, T, C>
where
    T: Serialize + DeserializeOwned + Clone,
    C: CustomMsg,
{
    type Err = CW721Error;

    fn transfer_nft(
        &self,
        deps: DepsMut,
        env: Env,
        info: MessageInfo,
        recipient: String,
        token_id: String,
    ) -> Result<Response<C>, CW721Error> {
        self._transfer_nft(deps, &env, &info, &recipient, &token_id)?;

        Ok(Response::new()
            .add_attribute("action", "transfer_nft")
            .add_attribute("sender", info.sender)
            .add_attribute("recipient", recipient)
            .add_attribute("token_id", token_id))
    }

    fn send_nft(
        &self,
        deps: DepsMut,
        env: Env,
        info: MessageInfo,
        contract: String,
        token_id: String,
        msg: Binary,
    ) -> Result<Response<C>, CW721Error> {
        // Transfer token
        self._transfer_nft(deps, &env, &info, &contract, &token_id)?;

        let send = Cw721ReceiveMsg {
            sender: info.sender.to_string(),
            token_id: token_id.clone(),
            msg,
        };

        // Send message
        Ok(Response::new()
            .add_message(send.into_cosmos_msg(contract.clone())?)
            .add_attribute("action", "send_nft")
            .add_attribute("sender", info.sender)
            .add_attribute("recipient", contract)
            .add_attribute("token_id", token_id))
    }

    fn approve(
        &self,
        deps: DepsMut,
        env: Env,
        info: MessageInfo,
        spender: String,
        token_id: String,
        expires: Option<Expiration>,
    ) -> Result<Response<C>, CW721Error> {
        self._update_approvals(deps, &env, &info, &spender, &token_id, true, expires)?;

        Ok(Response::new()
            .add_attribute("action", "approve")
            .add_attribute("sender", info.sender)
            .add_attribute("spender", spender)
            .add_attribute("token_id", token_id))
    }

    fn revoke(
        &self,
        deps: DepsMut,
        env: Env,
        info: MessageInfo,
        spender: String,
        token_id: String,
    ) -> Result<Response<C>, CW721Error> {
        self._update_approvals(deps, &env, &info, &spender, &token_id, false, None)?;

        Ok(Response::new()
            .add_attribute("action", "revoke")
            .add_attribute("sender", info.sender)
            .add_attribute("spender", spender)
            .add_attribute("token_id", token_id))
    }

    fn approve_all(
        &self,
        deps: DepsMut,
        env: Env,
        info: MessageInfo,
        operator: String,
        expires: Option<Expiration>,
    ) -> Result<Response<C>, CW721Error> {
        // reject expired data as invalid
        let expires = expires.unwrap_or_default();
        if expires.is_expired(&env.block) {
            return Err(CW721Error::Expired {});
        }

        // set the operator for us
        let operator_addr = deps.api.addr_validate(&operator)?;
        self.operators
            .save(deps.storage, (&info.sender, &operator_addr), &expires)?;

        Ok(Response::new()
            .add_attribute("action", "approve_all")
            .add_attribute("sender", info.sender)
            .add_attribute("operator", operator))
    }

    fn revoke_all(
        &self,
        deps: DepsMut,
        _env: Env,
        info: MessageInfo,
        operator: String,
    ) -> Result<Response<C>, CW721Error> {
        let operator_addr = deps.api.addr_validate(&operator)?;
        self.operators
            .remove(deps.storage, (&info.sender, &operator_addr));

        Ok(Response::new()
            .add_attribute("action", "revoke_all")
            .add_attribute("sender", info.sender)
            .add_attribute("operator", operator))
    }

    fn burn(
        &self,
        deps: DepsMut,
        env: Env,
        info: MessageInfo,
        token_id: String,
    ) -> Result<Response<C>, CW721Error> {
        let token = self.tokens.load(deps.storage, &token_id)?;
        self.check_can_send(deps.as_ref(), &env, &info, &token)?;

        self.tokens.remove(deps.storage, &token_id)?;
        self.decrement_tokens(deps.storage)?;

        Ok(Response::new()
            .add_attribute("action", "burn")
            .add_attribute("sender", info.sender)
            .add_attribute("token_id", token_id))
    }
}

// helpers
impl<'a, T, C> AnoneCw721Contract<'a, T, C>
where
    T: Serialize + DeserializeOwned + Clone,
    C: CustomMsg,
{
    pub fn _transfer_nft(
        &self,
        deps: DepsMut,
        env: &Env,
        info: &MessageInfo,
        recipient: &str,
        token_id: &str,
    ) -> Result<TokenInfo<T>, CW721Error> {
        let mut token = self.tokens.load(deps.storage, token_id)?;
        // ensure we have permissions
        self.check_can_send(deps.as_ref(), env, info, &token)?;
        // set owner and remove existing approvals
        token.owner = deps.api.addr_validate(recipient)?;
        token.approvals = vec![];
        self.tokens.save(deps.storage, token_id, &token)?;
        Ok(token)
    }

    #[allow(clippy::too_many_arguments)]
    pub fn _update_approvals(
        &self,
        deps: DepsMut,
        env: &Env,
        info: &MessageInfo,
        spender: &str,
        token_id: &str,
        // if add == false, remove. if add == true, remove then set with this expiration
        add: bool,
        expires: Option<Expiration>,
    ) -> Result<TokenInfo<T>, CW721Error> {
        let mut token = self.tokens.load(deps.storage, token_id)?;
        // ensure we have permissions
        self.check_can_approve(deps.as_ref(), env, info, &token)?;

        // update the approval list (remove any for the same spender before adding)
        let spender_addr = deps.api.addr_validate(spender)?;
        token.approvals = token
            .approvals
            .into_iter()
            .filter(|apr| apr.spender != spender_addr)
            .collect();

        // only difference between approve and revoke
        if add {
            // reject expired data as invalid
            let expires = expires.unwrap_or_default();
            if expires.is_expired(&env.block) {
                return Err(CW721Error::Expired {});
            }
            let approval = Approval {
                spender: spender_addr,
                expires,
            };
            token.approvals.push(approval);
        }

        self.tokens.save(deps.storage, token_id, &token)?;

        Ok(token)
    }

    /// returns true iff the sender can execute approve or reject on the contract
    pub fn check_can_approve(
        &self,
        deps: Deps,
        env: &Env,
        info: &MessageInfo,
        token: &TokenInfo<T>,
    ) -> Result<(), CW721Error> {
        // owner can approve
        if token.owner == info.sender {
            return Ok(());
        }
        // operator can approve
        let op = self
            .operators
            .may_load(deps.storage, (&token.owner, &info.sender))?;
        match op {
            Some(ex) => {
                if ex.is_expired(&env.block) {
                    Err(CW721Error::Unauthorized {})
                } else {
                    Ok(())
                }
            }
            None => Err(CW721Error::Unauthorized {}),
        }
    }

    /// returns true iff the sender can transfer ownership of the token
    pub fn check_can_send(
        &self,
        deps: Deps,
        env: &Env,
        info: &MessageInfo,
        token: &TokenInfo<T>,
    ) -> Result<(), CW721Error> {
        // owner can send
        if token.owner == info.sender {
            return Ok(());
        }

        // any non-expired token approval can send
        if token
            .approvals
            .iter()
            .any(|apr| apr.spender == info.sender && !apr.is_expired(&env.block))
        {
            return Ok(());
        }

        // operator can send
        let op = self
            .operators
            .may_load(deps.storage, (&token.owner, &info.sender))?;
        match op {
            Some(ex) => {
                if ex.is_expired(&env.block) {
                    Err(CW721Error::Unauthorized {})
                } else {
                    Ok(())
                }
            }
            None => Err(CW721Error::Unauthorized {}),
        }
    }
}


#[cfg(test)]
mod test {
    use std::borrow::BorrowMut;

    use cosmwasm_std::{testing::MockStorage, Addr, Empty, Order, StdResult};

    use crate::{state::{TokenInfo, TokenStatus}, AnoneCw721Contract};


    #[test]
    fn test_tokens() {
        let mut store = MockStorage::new();

        let owner1 = Addr::unchecked("addr1");

        let token1_id = "1".to_string();
        let token2_id = "2".to_string();


        let token1 : TokenInfo<Option<Empty>> = TokenInfo {
            owner: owner1.clone(),
            token_id: "10".to_string(),
            approvals: vec![],
            model_id: "1".to_string(),
            token_uri: "abc".to_string(),
            status: TokenStatus::Listing,
            extension: None,
        };

        let token2: TokenInfo<Option<Empty>> = TokenInfo {
            owner: owner1.clone(),
            token_id: "1".to_string(),
            approvals: vec![],
            model_id: "2".to_string(),
            token_uri: "abc".to_string(),
            status: TokenStatus::Listing,
            extension: None,
        };

        let sm : AnoneCw721Contract<Option<Empty>, Empty> = AnoneCw721Contract::default();

        sm.tokens.save(store.borrow_mut(), &token1_id, &token1).unwrap();
        sm.tokens.save(store.borrow_mut(), &token2_id, &token2).unwrap();

        let list: Vec<_> = sm.tokens
            .idx.owner
            .prefix(owner1)
            .range(&store, None, None, Order::Ascending)
            .collect::<StdResult<_>>().unwrap();

        println!("List {:?}", list);

        let list_by_model: Vec<_> = sm.tokens
        .idx.model
        .prefix("1".to_string())
        .range(&store, None, None, Order::Ascending)
        .collect::<StdResult<_>>().unwrap();

        println!("List by model: {:?}", list_by_model);

    }
}