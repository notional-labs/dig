const NFT = require("./bot/nft")


const main = async () => {
    let nft = new NFT();
    await nft.load();

    const contract_addr = "wasm16acn8ewsly23h8nv8ner8l448xmkmc7edn6kvalp7xh7dycdt97snkdafy";
    
    let receipt = await nft.load_contract(contract_addr);
    console.log(receipt);
}

main()
    .then(() => { process.exit(0); })
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
