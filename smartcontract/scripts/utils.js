const fs = require("fs");

const get_contract_address = async(network, contract_name)=>{
    const deployed_path= "scripts/deployed.json";

    const file = fs.readFileSync(deployed_path);
    const data = JSON.parse(file);

    try {
        const contract_addr = data[network][contract_name];
        return contract_addr;
    }
    catch (error){
        console.log(`Contract address not existed: ${error}`);
        process.exit(1);
    }
    
}

module.exports = {
    get_contract_address
}