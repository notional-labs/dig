use schemars::JsonSchema;
use serde::{Deserialize, Serialize};

use cosmwasm_std::{Binary, Decimal};
use cw721::Expiration;

use crate::{state::{CollectionInfo, Approval, TokenInfo, ModelInfo}, ContractError};

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, JsonSchema)]
pub struct InstantiateMsg {
    pub name: String,
    pub symbol: String,
    pub minter: String,
    pub collection_info: CollectionInfo<RoyaltyInfoResponse>,
}

#[derive(Serialize, Deserialize, Clone, PartialEq, JsonSchema, Debug)]
#[serde(rename_all = "snake_case")]
pub enum ExecuteMsg<T> {
    TransferNft { recipient: String, token_id: String },
    SendNft {
        contract: String,
        token_id: String,
        msg: Binary,
    },
    Approve {
        spender: String,
        token_id: String,
        expires: Option<Expiration>,
    },
    Revoke { spender: String, token_id: String },

    ApproveAll {
        operator: String,
        expires: Option<Expiration>,
    },

    RevokeAll { operator: String },

    Mint(MintMsg<T>),

    CreateShoeModel(CreateShoeModelMsg<T>),

    Burn { token_id: String },

    ModifyCollectionInfo {description: Option<String>, image: Option<String>, external_link: Option<String>, royalty_info: Option<RoyaltyInfoResponse> }
}

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, JsonSchema)]
pub struct MintMsg<T> {
    pub token_id: String,
    pub owner: String,
    pub model_id: String,
    pub size: String,
    pub extension: T,
}

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, JsonSchema)]
pub struct CreateShoeModelMsg<T> {
    pub model_id: String,
    pub owner: String,
    pub model_uri: String,
    pub extension: T,
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

#[derive(Serialize, Deserialize, Clone, PartialEq, JsonSchema, Debug)]
pub struct MinterResponse {
    pub minter: String,
}

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, JsonSchema)]
pub struct CollectionInfoResponse {
    pub creator: String,
    pub description: String,
    pub image: String,
    pub external_link: Option<String>,
    pub royalty_info: Option<RoyaltyInfoResponse>,
}

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, JsonSchema)]
pub struct RoyaltyInfoResponse {
    pub payment_address: String,
    pub share: Decimal,
}

impl RoyaltyInfoResponse {
    pub fn share_validate(&self) -> Result<Decimal, ContractError> {
        if self.share > Decimal::percent(20) {
            return Err(ContractError::InvalidRoyalities {});
        }

        Ok(self.share)
    }
}


#[derive(Serialize, Deserialize, Clone, PartialEq, JsonSchema, Debug)]
pub struct OwnerOfResponse {
    pub owner: String,
    pub approvals: Vec<Approval>,
}

#[derive(Serialize, Deserialize, Clone, PartialEq, JsonSchema, Debug)]
pub struct ApprovalResponse {
    pub approval: Approval,
}

#[derive(Serialize, Deserialize, Clone, PartialEq, JsonSchema, Debug)]
pub struct ApprovalsResponse {
    pub approvals: Vec<Approval>,
}

#[derive(Serialize, Deserialize, Clone, PartialEq, JsonSchema, Debug)]
pub struct OperatorsResponse {
    pub operators: Vec<Approval>,
}

#[derive(Serialize, Deserialize, Clone, PartialEq, JsonSchema, Debug)]
pub struct NumTokensResponse {
    pub count: u64,
}

#[derive(Serialize, Deserialize, Clone, PartialEq, JsonSchema, Debug)]
pub struct NumModelsResponse {
    pub count: u64,
}

#[derive(Serialize, Deserialize, Clone, PartialEq, JsonSchema, Debug)]
pub struct ContractInfoResponse {
    pub name: String,
    pub symbol: String,
}

#[derive(Serialize, Deserialize, Clone, PartialEq, JsonSchema, Debug)]
pub struct AllNftInfoResponse<T> {
    pub access: OwnerOfResponse,
    pub info: NftInfoResponse<T>,
}

#[derive(Serialize, Deserialize, Clone, PartialEq, JsonSchema, Debug)]
pub struct NftInfoResponse<T> {
    pub model_id: String,
    pub token_uri: String,
    pub size: String,
    pub extension: T,
}

#[derive(Serialize, Deserialize, Clone, PartialEq, JsonSchema, Debug)]
pub struct ModelInfoResponse<T> {
    pub owner: String,
    pub model_uri: String,
    pub extension: T,
}

#[derive(Serialize, Deserialize, Clone, PartialEq, JsonSchema, Debug)]
pub struct TokensResponse {
    pub tokens: Vec<String>,
}

#[derive(Serialize, Deserialize, Clone, PartialEq, JsonSchema, Debug)]
pub struct ModelsResponse {
    pub models: Vec<String>,
}

#[derive(Serialize, Deserialize, Clone, PartialEq, JsonSchema, Debug)]
pub struct AllNftsResponse<T> {
    pub all_tokens_info: Vec<TokenInfo<T>>,
}

#[derive(Serialize, Deserialize, Clone, PartialEq, JsonSchema, Debug)]
pub struct AllModelsResponse<T> {
    pub all_models_info: Vec<ModelInfo<T>>,
}