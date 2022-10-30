const Minter = require("../../bot/minter");
const NFT = require("../../bot/nft");
const fs = require("fs");
const {get_contract_address} = require("../../utils");

const deployed_path = "scripts/local_deployed";

const main = async () => {
    let nft = new NFT();
    await nft.load();
    let nft_upload_res = await nft.upload();
    let nft_code_id = nft_upload_res.codeId;

    console.log(`Code id of NFT: ${nft_code_id}`);

    let minter = new Minter();
    await minter.load();

    const deployer_key  = await minter.get_signer_address();
    const base_token_uri = "ipfs://base_image";
    const num_tokens = 10;
    const per_address_limit = 10;
    let cw_721_init_msg = {
        "name": "Test",
        "symbol": "ANCC",
        "minter": deployer_key.address,
        "collection_info": {
            "creator": deployer_key.address,
            "description": "test",
            "image": "ipfs://bafybeigi3bwpvyvsmnbj46ra4hyffcxdeaj6ntfk5jpic5mx27x6ih2qvq/images/1.png",
        }
    };

    let minter_init_msg = {
        "base_token_uri": base_token_uri,
        "num_tokens": num_tokens,
        "dig_cw721_code_id": nft_code_id,
        "dig_cw721_instantiate_msg": cw_721_init_msg,
        "per_address_limit": per_address_limit
    };

    let contract_addr = await minter.deploy(null, minter_init_msg);
    console.log(contract_addr)
    
    // TEST MINT 
    let mint_res = await minter.mint();
    console.log(mint_res)
} 


main()
    .then(() => { process.exit(0); })
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
