const env = require("../config");
const { makeCosmoshubPath } = require("@cosmjs/amino");
const { DirectSecp256k1HdWallet } = require("@cosmjs/proto-signing");
const { SigningCosmWasmClient, CosmWasmClient }= require("@cosmjs/cosmwasm-stargate");
const { GasPrice } = require("@cosmjs/stargate");
const fs = require("fs");
const BigNumber = require("big-number");

class Bot {
    constructor() {
        this.signer = null;
        this.signing_client = null;
        this.query_client = null;
        
        this.contract_addr = null;
    }

    // This part is for the connecter 
    load = async()=>{
        this.signer = await this.get_signer();
        this.signing_client = await this.get_signing_client(this.signer);
        this.query_client = await this.get_querying_client();
    }

    load_contract = async(contract_addr)=>{
        this.contract_addr = contract_addr;
    }

    get_signer_address = async(signer= null) => {
        if (signer == null){ 
            signer = this.signer;
        }

        let signer_key = await signer.getAccounts();
        return signer_key[0];
    }

    get_signer = async(menemonic=null) => {
        let seed_phrase = null;
        if (menemonic == null) {
            seed_phrase = env.MNEMONIC;
        }
        else {
            seed_phrase = menemonic;
        }
        const signer = await DirectSecp256k1HdWallet.fromMnemonic(
            seed_phrase,
            {
                hdPaths: [makeCosmoshubPath(0)],
                prefix: env.PREFIX,
            }
        );
        return signer;
    }

    get_signing_client = async(signer) =>{
        const signing_client = await SigningCosmWasmClient.connectWithSigner(
            env.RPC,
            signer,
            {
                prefix: env.PREFIX,
                gasPrice: GasPrice.fromString(env.GAS_PRICE),
            }
        );
        return signing_client;
    }

    get_querying_client = async() => {
        const query_client = await CosmWasmClient.connect(env.RPC);
        return query_client;
    }   

    _load_signer_client = async(sender)=> {
        let signing_client = this.signing_client;
        let signer_key = await this.get_signer_address();
        if (sender != null) {
            signing_client = await this.get_signing_client(signer);
            signer_key = await this.get_signer_address(signer);
        }

        return [signing_client, signer_key];
    }

    // Base contract method 
    upload_base = async(sender, wasm_dir)=>{
        const [signing_client, signer_key] = await this._load_signer_client(sender);
        const wasm_file = fs.readFileSync(wasm_dir);

        let receipt = await signing_client.upload(
            signer_key.address,
            wasm_file,
            "auto",
            "Upload"
        )
        return receipt;
    }

    instantiate_base = async(sender, code_id, init_msg, label)=>{
        const [signing_client, signer_key] = await this._load_signer_client(sender);

        console.log(init_msg)
        let receipt = await signing_client.instantiate(
            signer_key.address,
            code_id,
            init_msg,
            label,
            "auto"
        )

        return receipt;
    }

    execute_base = async(sender, exe_msg) => {
        const [signing_client, signer_key] = await this._load_signer_client(sender);

        if (this.contract_addr == null){
            console.log("xxxx Error: Please load a contract address");
            process.exit(1);
        }

        let receipt = await signing_client.execute(
            signer_key.address,
            this.contract_addr,
            exe_msg,
            "auto"
        );
        return receipt;
    }

    query_base = async(query_msg) => {
        let result = await this.query_client.queryContractSmart(
            this.contract_addr,
            query_msg
        )

        return result;
    }

}

module.exports = Bot