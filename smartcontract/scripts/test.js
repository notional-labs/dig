const NFT = require("./bot/nft")


const main = async () => {
    let nft = new NFT();
    await nft.load();

    let receipt = await nft.upload();
    console.log(receipt);
}

main()
    .then(() => { process.exit(0); })
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
