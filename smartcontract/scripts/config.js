
const env = {
    NETWORK: "local_osmosis",
    
    "local_osmosis": {
        MNEMONIC: "notice oak worry limit wrap speak medal online prefer cluster roof addict wrist behave treat actual wasp year salad speed social layer crew genius",
        RPC: "http://localhost:26657/",
        PREFIX: "osmo",
        GAS_PRICE: "0.25uosmo",
    },
    "malaga_testnet": {
        MNEMONIC: "street tree wild announce able curve void wife share surround settle oven warfare quantum shoot window sword property hand ritual survey clean health fame",
        RPC: "https://rpc.malaga-420.cosmwasm.com:443",
        PREFIX: "wasm",
        GAS_PRICE: "0.25umlg",
    },
    "notional_testnet": {
        MNEMONIC: "street tree wild announce able curve void wife share surround settle oven warfare quantum shoot window sword property hand ritual survey clean health fame",
        RPC: "http://95.217.121.243:2071/",
        PREFIX: "juno",
        GAS_PRICE: "0.25ujuno",
    }
    
};


module.exports = env;