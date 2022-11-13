const NFT = require("../bot/nft");
const fs = require("fs");

const deployed_path = "scripts/deployed.json";
const prompts = require('prompts');


const main = async () => {
    const file = fs.readFileSync(deployed_path);
    const data = JSON.parse(file);
    
    let nft = new NFT();
    await nft.load();

    const network_name = nft.network_name;

    let upload_tx = await nft.upload();
    let deployer_key = await nft.get_signer_address();
    
    let test_init_msg = {
        "name": "Test",
        "symbol": "ANCC",
        "minter": deployer_key.address,
        "collection_info": {
            "creator": deployer_key.address,
            "description": "test",
            "image": "ipfs://bafybeigi3bwpvyvsmnbj46ra4hyffcxdeaj6ntfk5jpic5mx27x6ih2qvq/images/1.png",
        }
    } 
    let instantiate_tx = await nft.instantiate(null, upload_tx.codeId, test_init_msg);

    console.log(`Contract deployed to: ${instantiate_tx.contractAddress}`);
    
    if (data[network_name]){
        data[network_name]["dig_cw721"] = instantiate_tx.contractAddress;
    }
    else {
        data[network_name] = {
            "dig_cw721": instantiate_tx.contractAddress
        }
    }
   
    // write address to file
    fs.writeFileSync(
        deployed_path,
        JSON.stringify(data)
    );

}


const load_instance = async()=>{
    
}

main()
    .then(() => { process.exit(0); })
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
