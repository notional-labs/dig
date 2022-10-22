# Introduction 
This repo contains the guide and scripts for setting up the environment, sample Counter contract and script for interacting using Wasmd 


## Setting up the environment 
### Installing Presequites 
- go 
- rust 
- wasmd 

``` 
https://docs.cosmwasm.com/docs/1.0/getting-started/installation
``` 

### Setting up the environment 
- Setup the wallet 
- Get the testnet environment 
- Getting the faucet 

```
https://docs.cosmwasm.com/docs/1.0/getting-started/setting-env
```

## Build and test the contract 
- Build 

```
cargo wasm 
```

```
./build.sh 
```
- Test 
```
cargo test 
```

Note: You can delete the target, Cargo.lock to clear build data 

## Deploy and interact 
Go to the scripts folder and do the following:
- upload_code.sh: To upload the code Id to the blockchain (if code_id existed, can skip)
- instantiate.sh: Create a contract instance in the blockchain (if the contract existed, can skip)
- set_counter.sh: set the value of the  counter of a contract 
- reset_counter.sh: reset the value of the counter to 0
- query_counter.sh: get the value of the counter 