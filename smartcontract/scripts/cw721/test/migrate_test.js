const Bot = require("../../bot/bot");
const fs = require("fs");
const {get_contract_address} = require("../../utils");

const deployed_path = "scripts/local_deployed";


const main = async () => {
    
    let bot = new Bot();
    await bot.load();

    const wasm_dir = "artifacts/reflect.wasm";
    
    const deployer_key  = await bot.get_signer_address();
    // let contract_addr = await bot.deploy_base(null,wasm_dir, {}, "reflect");
    // console.log(contract_addr)

    // let contract = await bot.instantiate_base(null, 1798, {}, "no");
    // console.log(contract);

    await bot.load_contract("wasm1c9rd2e7fmxs3wqgjc8jgmd4v5qk9zvk5qetxcjczuvqc75l753usafzw58");

    // let new_code = await bot.upload_base(null, wasm_dir);
    // console.log(new_code)
    const new_code_id = 1799;

    let receipt = await bot.migrate_base(null, new_code_id, {});
    console.log(receipt)
    
}


main()
    .then(() => { process.exit(0); })
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
