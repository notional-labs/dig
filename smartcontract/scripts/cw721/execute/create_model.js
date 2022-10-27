const NFT = require("../../bot/nft");
const {get_contract_address} = require("../../utils");

const main = async () => {
    let nft = new NFT();
    await nft.load();

    const contract_addr = await get_contract_address(nft.network_name, "dig_cw721")
    await nft.load_contract(contract_addr);

    const model_id = "1"; // need to be unique
    const model_uri = "ipfs://ipfs/bafybeiaivv62j7jxlkahxobfr5io7h2j56obw5mojljho2ybg7zhah2eue/galaxyfcnCU3/2";
    const deployer = await nft.get_signer_address();
    const owner = deployer.address;
    const supply_limit = 1;
    const extension = {
        "name": "Hanoi",
        "image": "Some image url here",
        "description": "Hanoi which is located in the central of Northern VN, ... ",
        "coordinate": {
            "lat": "105.8342° N",
            "lon": "21.0278° N"
        },
        "land_area": "1005",
        "construction_area": "2002",
        "image_gallary": [
            "image_1_url",
            "image_2_url"
        ],
    }

    // Sender = null means that the wallet from the config.js will be used to perform the tx
    await nft.create_model(null, model_id, owner, model_uri, supply_limit, extension);

}

main()
    .then(() => { process.exit(0); })
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
