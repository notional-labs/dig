use cosmwasm_std::{Timestamp, Uint128};
use dig::cw721::RoyaltyInfoResponse;
use schemars::JsonSchema;
use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize, Clone, PartialEq, JsonSchema, Debug)]
pub struct ContractInfoResponse {
    pub name: String,
    pub native_denom: String
}

#[derive(Serialize, Deserialize, Clone, PartialEq, JsonSchema, Debug)]
pub struct QueryOfferingsResult {
    pub id: String,
    pub token_id: String,
    pub list_price: Uint128,
    pub royalty_info: Option<RoyaltyInfoResponse>,
    pub contract_addr: String,
    pub seller: String,
    pub listing_time: Timestamp,
}

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, JsonSchema)]
pub struct OfferingsResponse {
    pub offerings: Vec<QueryOfferingsResult>,
}