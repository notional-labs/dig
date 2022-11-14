const Marketplace = require("../bot/marketplace");
const fs = require("fs");

const deployed_path = "scripts/deployed.json";
const prompts = require('prompts');


const main = async () => {
    const file = fs.readFileSync(deployed_path);
    const data = JSON.parse(file);
    
    let marketplace = new Marketplace();
    await marketplace.load();

    const network_name = marketplace.network_name;

    const mp_init_msg = {
        "name": "dig",
        "native_denom": "ujunox"
    }
    let contract_addr = await marketplace.deploy(null, mp_init_msg);
    
    console.log(`Contract addr: ${contract_addr}`);

    if (data[network_name]){
        data[network_name]["dig_marketplace"] = contract_addr;
    }
    else {
        data[network_name] = {
            "dig_marketplace": contract_addr
        }
    }
   
    // write address to file
    fs.writeFileSync(
        deployed_path,
        JSON.stringify(data)
    );

}


main()
    .then(() => { process.exit(0); })
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
