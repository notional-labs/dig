#[cfg(not(feature = "library"))]
use cosmwasm_std::entry_point;
use cosmwasm_std::{Binary, Deps, DepsMut, Env, MessageInfo, Response, StdResult, to_binary};
use cw2::set_contract_version;

use crate::error::ContractError;
use crate::msg::{ExecuteMsg, InstantiateMsg, QueryMsg, GetCounterResponse};
use crate::state::{STATE, State};

const CONTRACT_NAME: &str = "crates.io:counter";
const CONTRACT_VERSION: &str = env!("CARGO_PKG_VERSION");

#[cfg_attr(not(feature = "library"), entry_point)]
pub fn instantiate(
    deps: DepsMut,
    _env: Env,
    _info: MessageInfo,
    _msg: InstantiateMsg,
) -> Result<Response, ContractError> {
    set_contract_version(deps.storage, CONTRACT_NAME, CONTRACT_VERSION)?;

    let state = State {
        count: 0
    };
    STATE.save(deps.storage, &state)?;
    Ok(Response::new().add_attribute("action", "instantiate"))
}

#[cfg_attr(not(feature = "library"), entry_point)]
pub fn execute(
    deps: DepsMut,
    _env: Env,
    _info: MessageInfo,
    msg: ExecuteMsg,
) -> Result<Response, ContractError> {
    match msg {
        ExecuteMsg::Increment { } => exe_increment(deps),
        ExecuteMsg::Reset {} => exe_reset_counter(deps)
    }
}

fn exe_increment(deps:DepsMut) -> Result<Response, ContractError>{
    let mut state = STATE.load(deps.storage)?;
    state.count +=1;
    STATE.save(deps.storage, &state)?;
    Ok(Response::new().add_attribute("action", "increment"))
}

fn exe_reset_counter(deps:DepsMut) -> Result<Response, ContractError>{
    let state = State {
        count: 0
    };
    STATE.save(deps.storage, &state)?;
    Ok(Response::new().add_attribute("action", "reset_counter"))
}

#[cfg_attr(not(feature = "library"), entry_point)]
pub fn query(deps: Deps, _env: Env, msg: QueryMsg) -> StdResult<Binary> {
    match msg {
        QueryMsg::GetCounter { } => to_binary(&query_counter(deps))
    }
}

fn query_counter(deps: Deps) -> GetCounterResponse {
    let state = STATE.load(deps.storage);
    GetCounterResponse {
        value: state.unwrap().count
    }
}

#[cfg(test)]
mod tests {
    use cosmwasm_std::{testing::{mock_dependencies, mock_env, mock_info}, attr, from_binary};

    use crate::{msg::{InstantiateMsg, ExecuteMsg, QueryMsg, GetCounterResponse}, contract::{instantiate, query}};

    use super::execute;

    #[test]
    fn test_instantiate(){
        let mut deps =  mock_dependencies();
        let env = mock_env();
        let info = mock_info("addr1", &[]);

        // Instantiate  
        let msg = InstantiateMsg{
        };
        let res =  instantiate(deps.as_mut(), env, info, msg).unwrap();

        println!("Res: {:?}", res);
        assert_eq!(res.attributes, vec![
            attr("action", "instantiate")
        ]);
    }


    #[test]
    fn test_increment(){
        let mut deps =  mock_dependencies();
        let env = mock_env();
        let info = mock_info("addr1", &[]);

        // Instantiate  
        let msg = InstantiateMsg{
        };
        instantiate(deps.as_mut(), env.clone(), info.clone(), msg).unwrap();

        // Set the counter 
        let set_counter_msg = ExecuteMsg::Increment {};
        let resp_set_counter = execute(deps.as_mut(), env.clone(), info.clone(), set_counter_msg).unwrap();
        assert_eq!(resp_set_counter.attributes, vec![
            attr("action", "increment")
        ]);

        // Validate the data
        let get_counter_msg = QueryMsg::GetCounter {};
        let query_resp = query(deps.as_ref(), env, get_counter_msg).unwrap();
        let counter:GetCounterResponse = from_binary(&query_resp).unwrap();

        assert_eq!(counter.value, 1);
    }

    #[test]
    fn test_reset_counter(){
        let mut deps =  mock_dependencies();
        let env = mock_env();
        let info = mock_info("addr1", &[]);

        // Instantiate  
        let msg = InstantiateMsg{
        };
        instantiate(deps.as_mut(), env.clone(), info.clone(), msg).unwrap();

        // Set the counter 
        let set_counter_msg = ExecuteMsg::Increment {};
        let _resp_set_counter = execute(deps.as_mut(), env.clone(), info.clone(), set_counter_msg).unwrap();

        // Reset the counter 
        let reset_counter_msg = ExecuteMsg::Reset {  } ;
        let resp_reset_counter = execute(deps.as_mut(), env.clone(), info.clone(), reset_counter_msg).unwrap();
        assert_eq!(resp_reset_counter.attributes, vec![
            attr("action", "reset_counter")
        ]);

        // Validate the data
        let get_counter_msg = QueryMsg::GetCounter {};
        let query_resp = query(deps.as_ref(), env, get_counter_msg).unwrap();
        let counter:GetCounterResponse = from_binary(&query_resp).unwrap();

        assert_eq!(counter.value, 0);
    }
}
