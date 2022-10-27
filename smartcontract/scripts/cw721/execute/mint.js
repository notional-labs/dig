const NFT = require("../../bot/nft");
const {get_contract_address} = require("../../utils");

const main = async () => {
    let nft = new NFT();
    await nft.load();

    const contract_addr = await get_contract_address(nft.network_name, "dig_cw721")
    await nft.load_contract(contract_addr);

    const deployer = await nft.get_signer_address();
    const owner = deployer.address;
    
    const model_id = "1";  // this need to be created 
    const token_id = "1"; // this need to be unique 

    // Sender = null means that the wallet from the config.js will be used to perform the tx
    await nft.mint(null, token_id, owner, model_id, null);

}

main()
    .then(() => { process.exit(0); })
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
