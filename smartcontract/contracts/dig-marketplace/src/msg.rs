use cosmwasm_std::{Uint128};
use cw721::Cw721ReceiveMsg;
use schemars::JsonSchema;
use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, JsonSchema)]
pub struct InstantiateMsg {
    pub name: String,
    pub native_denom: String
}

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, JsonSchema)]
#[serde(rename_all = "snake_case")]
pub enum ExecuteMsg {
    WithdrawNft { offering_id: String },
    MakeOrder { offering_id: String},
    ReceiveNft(Cw721ReceiveMsg),
    UpdatePrice { offering_id: String, update_price: Uint128 }
}

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, JsonSchema)]
#[serde(rename_all = "snake_case")]
pub struct SellNft {
    pub list_price: Uint128,
}


#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, JsonSchema)]
#[serde(rename_all = "snake_case")]
pub struct BuyNft {
    pub offering_id: String,
}


#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, JsonSchema)]
#[serde(rename_all = "snake_case")]
pub enum QueryMsg {
    GetOfferings {
        sort_listing: String
    },

    GetOfferingsByPriceRange {
        min: Uint128,
        max: Uint128,
        sort_listing: String
    },

    GetOfferingsOfCollection {
        contract_addr: String,
        sort_listing: String
    },

    GetOfferingsOfSeller {
        seller: String,
        sort_listing: String
    },
}