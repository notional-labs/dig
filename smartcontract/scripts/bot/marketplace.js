const Bot = require("./bot");

class Marketplace extends Bot { 
    constructor() {
        super()
        this.wasm_dir = "artifacts/dig_marketplace.wasm"
    }

    upload = async()=>{
        let receipt = await this.upload_base(null, this.wasm_dir);
        return receipt;
    }

    instantiate = async(sender, code_id, init_msg)=> {
        let receipt= await this.instantiate_base(sender, code_id, init_msg, "marketplace")
        return receipt;
    }

    migrate = async(sender, new_code_id)=>{
        let receipt = await this.migrate_base(sender, new_code_id, {});
        return receipt;
    }

    deploy = async(sender, init_msg) => {
        let contract_addr = await this.deploy_base(sender, this.wasm_dir, init_msg, "marketplace");
        return contract_addr;
    }

    make_offer = async(sender, offer_id, fund) => {
        const exe_msg = {
            "make_order": {
                "offering_id": offer_id
            }
        }

        const receipt = await this.execute_base(
            sender, 
            exe_msg,
            fund
        )
        return receipt;
    }

    get_offerings = async(type)=> {
        const query_msg = {
            "get_offerings": {
                "sort_listing": type
            }
        }

        let result = await this.query_base(query_msg);
        return result;
    }
}

module.exports = Marketplace