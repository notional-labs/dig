const Bot = require("./bot");

class Minter extends Bot { 
    constructor() {
        super()
        this.wasm_dir = "artifacts/dig_minter.wasm"
    }

    upload = async()=>{
        let receipt = await this.upload_base(null, this.wasm_dir);
        return receipt;
    }

    instantiate = async(sender, code_id, init_msg)=> {
        let receipt= await this.instantiate_base(sender, code_id, init_msg, "minter")
        return receipt;
    }

    migrate = async(sender, new_code_id)=>{
        let receipt = await this.migrate_base(sender, new_code_id, {});
        return receipt;
    }

    deploy = async(sender, init_msg) => {
        let contract_addr = await this.deploy_base(sender, this.wasm_dir, init_msg, "minter");
        return contract_addr;
    }

    mint = async(sender) => {
        const exe_msg = {
            "mint": {
            }
        }

        const receipt = await this.execute_base(
            sender, 
            exe_msg
        )
        return receipt;
    }

}

module.exports = Minter