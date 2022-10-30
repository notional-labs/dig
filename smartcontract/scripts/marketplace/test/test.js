const Marketplace = require("../../bot/marketplace");
const NFT = require("../../bot/nft");
const fs = require("fs");
const {get_contract_address} = require("../../utils");
const { coins } = require("@cosmjs/stargate");


const deployed_path = "scripts/local_deployed";

const main = async () => {
    
    // Create and init the marketplace
    let marketplace = new Marketplace();
    await marketplace.load();

    const mp_init_msg = {
        "name": "dig",
        "native_denom": "uosmo"
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

    let offerings = await marketplace.get_offerings("price_lowest");
    let offer_id = offerings.offerings[0].id;

    console.log(`New order was created with the offer id: ${offer_id}`);

    let user2 = await marketplace.get_test_signer(1);
    console.log(user2)
    const fund = coins("10000", "uosmo");
    await marketplace.make_offer(user2, offer_id, fund);
   
} 


main()
    .then(() => { process.exit(0); })
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
