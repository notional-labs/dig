const NFT = require("../../bot/nft");

const main = async () => {
    let nft = new NFT();
    await nft.load();

    const contract_addr = "wasm16acn8ewsly23h8nv8ner8l448xmkmc7edn6kvalp7xh7dycdt97snkdafy";
    await nft.load_contract(contract_addr);

    const model_uri = "ipfs://ipfs/bafybeiaivv62j7jxlkahxobfr5io7h2j56obw5mojljho2ybg7zhah2eue/galaxyfcnCU3/2";
    const owner = "wasm1zgwfdu7meqhkgt0c6p039qm57jv6tgkwt5nx6x";

    const create_model_msg = {
        "create_shoe_model": {
            "model_id": "1",
            "model_uri": model_uri,
            "owner": owner
        }
    };

    let receipt = await nft.create_model(null, create_model_msg);
    console.log(receipt)

}

main()
    .then(() => { process.exit(0); })
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
