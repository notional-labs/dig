const NFT = require("../../bot/nft");
const fs = require("fs");
const {get_contract_address} = require("../../utils");

const deployed_path = "scripts/local_deployed";


const main = async () => {
    
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

    let contract_addr = await nft.deploy(null, test_init_msg);
    
    
    const model_id = "1";
    const model_uri = "ipfs://ipfs/bafybeiaivv62j7jxlkahxobfr5io7h2j56obw5mojljho2ybg7zhah2eue/galaxyfcnCU3/2";
    const owner = deployer_key.address;
    await nft.create_model(null, model_id, owner, model_uri, null);

    const all_models = await nft.query_all_models();
    console.log(all_models);


    const token_id = "1";
    const size = "38"
    await nft.mint(null, token_id, owner, model_id, size, null);

    let all_tokens = await nft.query_all_tokens();
    console.log(all_tokens)

}


main()
    .then(() => { process.exit(0); })
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
