use cosmwasm_std::StdError;
use thiserror::Error;

#[derive(Error, Debug)]
pub enum ContractError {
    #[error("{0}")]
    Std(#[from] StdError),

    #[error("No data in ReceiveMsg")]
    NoData {},

    #[error("Unauthorized")]
    Unauthorized {},
    // Add any other custom errors you like here.
    // Look at https://docs.rs/thiserror/1.0.21/thiserror/ for details.
    #[error("Insufficient funds")]
    InsufficientFunds {},
    
    #[error("Price must be positive")]
    PriceMustBePosiTive {},

    #[error("Marketplace don't have permission with this nft")]
    NoPermission {},

    #[error("Don't have enough fund")]
    NoFunds {},

    #[error("Have more than one denom")]
    MultipleDenoms {},

    #[error("Have more than one denom")]
    WrongDenoms {},

}
