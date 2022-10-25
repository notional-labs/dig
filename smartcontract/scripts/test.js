const NFT = require("./bot/nft")


const main = async () => {
    let nft = new NFT();
    await nft.load();

    console.log(await nft.get_signer_address())
}

main()
    .then(() => { process.exit(0); })
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
