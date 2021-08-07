# dig

We're digging for new cities.

Here's a little light background reading:

* https://blurt.blog/blurt/@jacobgadikian/baby-blockchains
* https://blurt.blog/blurt/@jacobgadikian/blockchain-application-tco
* https://1729.com/miami/
* https://podclips.com/ct/gBhDsq

## Get started
We are accepting genesis transactions.  Here are some generic linux instructions for doing those.  They assume that you have the github cli installed.

```bash
cd ~/
git clone https://github.com/faddat/dig
cd dig
go mod tidy
cd cmd/digd
go install .
cd ~/
digd init yourname
cp dig/networks/testnet-2/genesis.json ~/.dig/config
# DEAR GOD KEEP YOUR SEED PHRASE.
digd keys add validator
digd add-genesis-account validator 100000000udig
digd gentx validator 900000000udig --chain-id dig-testnet-2
cp ~/.dig/config/gentx/* ~/dig/networks/testnet-2/gentx
cd dig
git add networks
git commit -m "gentx yourvalidatormoniker"
gh auth login
gh pr create
```


## Configure

Your blockchain in development can be configured with `config.yml`. To learn more, see the [Starport docs](https://docs.starport.network).

## Launch

To launch your blockchain live on multiple nodes, use `starport network` commands. Learn more about [Starport Network](https://github.com/tendermint/spn).

## Web Frontend

Starport has scaffolded a Vue.js-based web app in the `vue` directory. Run the following commands to install dependencies and start the app:

```
cd vue
npm install
npm run serve
```

The frontend app is built using the `@starport/vue` and `@starport/vuex` packages. For details, see the [monorepo for Starport front-end development](https://github.com/tendermint/vue).

## Learn more

- [Starport](https://github.com/tendermint/starport)
- [Starport Docs](https://docs.starport.network)
- [Cosmos SDK documentation](https://docs.cosmos.network)
- [Cosmos SDK Tutorials](https://tutorials.cosmos.network)
- [Discord](https://discord.gg/W8trcGV)
