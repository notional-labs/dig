
const Marketplace = require("../bot/marketplace");
const NFT = require("../bot/nft");
const fs = require("fs");
const {get_contract_address} = require("../../utils");

const deployed_path = "scripts/local_deployed";

const main = async () => {
    // Create and init the marketplace
    let marketplace = new Marketplace();
    await marketplace.load();

    const mp_init_msg = {
        "name": "dig"
    }
    await marketplace.deploy(null, mp_init_msg);
    
    // Deploy the nft 
    let nft = new NFT();
    await nft.load();

    const deployer_key  = await nft.get_signer_address();
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

    await nft.deploy(null, test_init_msg);  

    // Create model and mint nft for the owner
    const model_id = "1";
    const model_uri = "ipfs://ipfs/bafybeiaivv62j7jxlkahxobfr5io7h2j56obw5mojljho2ybg7zhah2eue/galaxyfcnCU3/2";
    const owner = deployer_key.address;
    const supply_limit = 1;
    const extension = null;
    await nft.create_model(null, model_id, owner, model_uri, supply_limit, extension);

    const token_id = "1";
    await nft.mint(null, token_id, owner, model_id, null);


    // Send nft to the market place 
    let result = await nft.send_nft(null, marketplace.contract_addr, token_id, "10000");
    console.log(result)
} 


main()
    .then(() => { process.exit(0); })
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
