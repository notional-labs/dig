use schemars::JsonSchema;
use serde::{Deserialize, Serialize};

use cosmwasm_std::{Addr};
use cw_storage_plus::{Item, Map};

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, JsonSchema)]
pub struct Config {
    pub admin: Addr,
    pub base_token_uri: String,
    pub num_tokens: u32,
    pub dig_cw721_code_id: u64,
    pub per_address_limit: u32,
}

pub const CONFIG: Item<Config> = Item::new("config");
pub const DIG_CW721_ADDRESS: Item<Addr> = Item::new("dig_cw721_address");
pub const MINTABLE_TOKEN_IDS: Map<u32, bool> = Map::new("mt");
pub const MINTABLE_NUM_TOKENS: Item<u32> = Item::new("mintable_num_tokens");
pub const MINTER_ADDRS: Map<Addr, u32> = Map::new("ma");