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

    instantiate = async(sender, code_id, init_msg)=> {
        let receipt= await this.instantiate_base(sender, code_id, init_msg, "nft")
        return receipt;
    }

    migrate = async(sender, new_code_id)=>{
        let receipt = await this.migrate_base(sender, new_code_id, {});
        return receipt;
    }

    deploy = async(sender, init_msg) => {
        let contract_addr = await this.deploy_base(sender, this.wasm_dir, init_msg, "dig_cw721");
        return contract_addr;
    }

    create_model = async(sender, model_id, owner, model_uri, supply_limit, extension) => {
        const create_model_msg = {
            "create_model": {
                "model_id": model_id,
                "owner": owner, 
                "model_uri": model_uri,
                "supply_limit": supply_limit,
                "extension": extension
            }
        }
        let receipt = await this.execute_base(
            sender, 
            create_model_msg
        )
        return receipt;
    }

    mint = async(sender, token_id, owner, model_id, extension) => {
        const exe_msg = {
            "mint": {
                "token_id": token_id,
                "owner": owner,
                "model_id": model_id,
                "extension": extension
            }
        }

        const receipt = await this.execute_base(
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

    query_collection_info = async() => {
        const query_msg = {
            "collection_info": {
            }
        }

        let result = await this.query_base(query_msg);
        return result;
    }

    query_all_tokens = async()=> {
        const query_msg = {
            "all_tokens": {
            }
        }

        let result = await this.query_base(query_msg);
        return result;
    }

    query_nft = async(token_id)=> {
        const query_msg = {
            "all_nft_info": {
                "token_id": token_id
            }
        }

        let result = await this.query_base(query_msg);
        return result;
    }

    query_model = async(model_id)=>{
        const query_msg = {
            "model_info": {
                "model_id": model_id
            }
        }

        let result = await this.query_base(query_msg);
        return result;
    }
}

module.exports = NFT