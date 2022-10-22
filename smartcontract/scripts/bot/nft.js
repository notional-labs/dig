const Bot = require("./bot");

class NFT extends Bot { 
    constructor() {
        super()
        this.wasm_dir = "artifacts/dig_cw721.wasm"
    }

    upload = async()=>{
        let receipt = await this.upload_base(null, this.wasm_dir);
        return receipt;
    }

    instantiate = async(sender, code_id)=> {
        let test_init_msg = {
            "name": "Test",
            "symbol": "ANCC",
            "minter": "wasm1zgwfdu7meqhkgt0c6p039qm57jv6tgkwt5nx6x",
            "collection_info": {
                "creator": "wasm1zgwfdu7meqhkgt0c6p039qm57jv6tgkwt5nx6x",
                "description": "test",
                "image": "ipfs://bafybeigi3bwpvyvsmnbj46ra4hyffcxdeaj6ntfk5jpic5mx27x6ih2qvq/images/1.png",
            }
        } 

        let receipt= await this.instantiate_base(null, code_id, test_init_msg, "nft")
        return receipt;
    }

    create_model = async(sender, exe_msg) => {
        let receipt = await this.execute_base(
            sender, 
            exe_msg
        )
        return receipt;
    }

    // Querierrrrr 
    query_all_models = async() => {
        const query_msg = {
            "all_models": {

            }
        }

        let result = await this.query_base(query_msg);
        return result;
    }

}

module.exports = NFT