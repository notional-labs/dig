# Smart contracts for NFT platform 



## Scripts 

### Config
Setting the network for interaction 

```
const env = {
    NETWORK: "notional_testnet",
    
    "local_osmosis": {
        MNEMONIC: "notice oak worry limit wrap speak medal online prefer cluster roof addict wrist behave treat actual wasp year salad speed social layer crew genius",
        RPC: "http://localhost:26657/",
        PREFIX: "osmo",
        GAS_PRICE: "0.25uosmo",
    },
     "notional_testnet": {
        MNEMONIC: "street tree wild announce able curve void wife share surround settle oven warfare quantum shoot window sword property hand ritual survey clean health fame",
        RPC: "http://95.217.121.243:2071/",
        PREFIX: "juno",
        GAS_PRICE: "0.25ujunox",
    }
}
``` 

The config file need to provide the above information in order for the scripts to interact to a chain. 
The MNEMONIC will set the default wallet for the bot to interact to the blockchain.

Change the env[NETWORK] to the key of the network config in order to interact to a different network
### Running scripts 

node scripts/cw721/... 



### Conventions
When interacting with the smart contract via scripts/, we often need to provide signer.

```
If signer is set to null, we use the default wallet from mnemonic key from config.js
```

We can get signer with a diferrent menomnic using the function bot.get_signer()