# dig

We're digging for new cities.

Here's a little light background reading:

https://blurt.blog/blurt/@jacobgadikian/baby-blockchains
https://blurt.blog/blurt/@jacobgadikian/blockchain-application-tco
https://1729.com/miami/
https://podclips.com/ct/gBhDsq

## Get started

NB: Starport commands don't work right now because we're on Cosmos SDK 0.43.0.  It is likely they'll work again sometime soon!

```
starport serve
```

`serve` command installs dependencies, builds, initializes, and starts your blockchain in development.

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
