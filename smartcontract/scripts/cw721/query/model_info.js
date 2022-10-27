const NFT = require("../../bot/nft");
const {get_contract_address} = require("../../utils");
const prompts = require('prompts');

const main = async () => {
    let nft = new NFT();
    await nft.load();

    const contract_addr = await get_contract_address(nft.network_name, "dig_cw721")
    await nft.load_contract(contract_addr);

    const cli_res = await prompts([
        {
          type: 'text',
          name: 'model_id',
          message:
            `Enter the model id to query for ${contract_addr}: `,
        },
      ]);

    console.log("\n =====================\nQuery result is: ")
    let result = await nft.query_model(cli_res.model_id);
    console.log(result);

}

main()
    .then(() => { process.exit(0); })
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
