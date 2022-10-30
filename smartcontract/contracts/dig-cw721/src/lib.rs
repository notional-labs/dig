mod contract;
pub mod msg;
mod query;
pub mod state;
pub mod metadata;

pub use dig::errors::CW721Error;
pub use dig::cw721::{InstantiateMsg, QueryMsg};
pub use crate::msg::{ExecuteMsg, MintMsg, MinterResponse};
pub use crate::state::AnoneCw721Contract;
use cosmwasm_std::Empty;

use crate::metadata::{Metadata};

// This is a simple type to let us handle empty extensions
pub type Extension = Option<Metadata>;

#[cfg(not(feature = "library"))]
pub mod entry {
    use super::*;

    use cosmwasm_std::entry_point;
    use cosmwasm_std::{Binary, Deps, DepsMut, Env, MessageInfo, Response, StdResult};

    // This makes a conscious choice on the various generics used by the contract
    #[entry_point]
    pub fn instantiate(
        deps: DepsMut,
        env: Env,
        info: MessageInfo,
        msg: InstantiateMsg,
    ) -> Result<Response, CW721Error> {
        let tract = AnoneCw721Contract::<Extension, Empty>::default();
        tract.instantiate(deps, env, info, msg)
    }

    #[entry_point]
    pub fn execute(
        deps: DepsMut,
        env: Env,
        info: MessageInfo,
        msg: ExecuteMsg<Extension>,
    ) -> Result<Response, CW721Error> {
        let tract = AnoneCw721Contract::<Extension, Empty>::default();
        tract.execute(deps, env, info, msg)
    }

    #[entry_point]
    pub fn query(deps: Deps, env: Env, msg: QueryMsg) -> StdResult<Binary> {
        let tract = AnoneCw721Contract::<Extension, Empty>::default();
        tract.query(deps, env, msg)
    }
}


