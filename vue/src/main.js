import { createApp } from 'vue'
import App from './App.vue'
import store from './store'
import router from './router'
import vueLib from '@starport/vue'

const app = createApp(App)
app.config.globalProperties._depsLoaded = true
app.use(store).use(router).use(vueLib).mount('#app')

document.addEventListener("DOMContentLoaded", function(event) {
    async function connect() {
        await window.keplr.experimentalSuggestChain({
            chainId: "dig",
            chainName: "Dig",
            rpc: "http://165.232.167.156:26657",
            rest: "http://165.232.167.156:1317",
            bip44: {
                coinType: 118,
            },
            bech32Config: {
                bech32PrefixAccAddr: "dig",
                bech32PrefixAccPub: "dig" + "pub",
                bech32PrefixValAddr: "dig" + "valoper",
                bech32PrefixValPub: "dig" + "valoperpub",
                bech32PrefixConsAddr: "dig" + "valcons",
                bech32PrefixConsPub: "dig" + "valconspub",
           },
            currencies: [
                {
                    coinDenom: "DIG",
                    coinMinimalDenom: "udig",
                    coinDecimals: 6,
                    coinGeckoId: "dig",
                },
            ],
            feeCurrencies: [
                {
                    coinDenom: "DIG",
                    coinMinimalDenom: "udig",
                    coinDecimals: 6,
                    coinGeckoId: "dig",
                },
            ],
            stakeCurrency: {
                coinDenom: "DIG",
                coinMinimalDenom: "udig",
                coinDecimals: 6,
                coinGeckoId: "dig",
            },
            coinType: 118,
            gasPriceStep: {
                low: 0.01,
                average: 0.025,
                high: 0.03,
            },
        });
    }
    connect();

}); 
