
use schemars::JsonSchema;
use serde::{Deserialize, Serialize};

use cosmwasm_std::{Addr, Decimal};
use crate::errors::CW721Error;


#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, JsonSchema)]
pub struct CollectionInfo<T> {
    pub creator: String,
    pub description: String,
    pub image: String,
    pub external_link: Option<String>,
    pub royalty_info: Option<T>,
}

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, JsonSchema)]
pub struct RoyaltyInfo {
    pub payment_address: Addr,
    pub share: Decimal,
}


#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, JsonSchema)]
pub struct RoyaltyInfoResponse {
    pub payment_address: String,
    pub share: Decimal,
}


impl RoyaltyInfoResponse {
    pub fn share_validate(&self) -> Result<Decimal, CW721Error> {
        if self.share > Decimal::percent(20) {
            return Err(CW721Error::InvalidRoyalities {});
        }

        Ok(self.share)
    }
}

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, JsonSchema)]
pub struct InstantiateMsg {
    pub name: String,
    pub symbol: String,
    pub minter: String,
    pub collection_info: CollectionInfo<RoyaltyInfoResponse>,
}




#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, JsonSchema)]
#[serde(rename_all = "snake_case")]
pub enum QueryMsg {
    OwnerOf {
        token_id: String,
        include_expired: Option<bool>,
    },

    Approval {
        token_id: String,
        spender: String,
        include_expired: Option<bool>,
    },

    Approvals {
        token_id: String,
        include_expired: Option<bool>,
    },

    AllOperators {
        owner: String,
        include_expired: Option<bool>,
        start_after: Option<String>,
        limit: Option<u32>,
    },
 
    NumTokens {},

    NumModels {},

    ContractInfo {},
 
    NftInfo {
        token_id: String,
    },

    AllNftInfo {
        token_id: String,
        include_expired: Option<bool>,
    },

    ModelInfo {
        model_id: String,
    },

    Tokens {
        owner: String,
        start_after: Option<String>,
        limit: Option<u32>,
    },

    AllTokens {
        start_after: Option<String>,
        limit: Option<u32>,
    },

    AllTokensInfo {
        start_after: Option<String>,
        limit: Option<u32>,
    },

    AllModels {
        start_after: Option<String>,
        limit: Option<u32>,
    },

    AllModelsInfo {
        start_after: Option<String>,
        limit: Option<u32>,
    },

    Minter {},

    CollectionInfo {},
}

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, JsonSchema)]
pub struct CollectionInfoResponse {
    pub creator: String,
    pub description: String,
    pub image: String,
    pub external_link: Option<String>,
    pub royalty_info: Option<RoyaltyInfoResponse>,
}

