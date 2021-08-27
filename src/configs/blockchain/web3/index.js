const Web3 = require('web3');
require('dotenv').config()

const binanceProvider={
    MAINNET:[
        new Web3('https://silent-black-river.bsc.quiknode.pro/1e43f97a9290a7219de46e1624ae5ad8b03a9b3e/'),
        new Web3('https://silent-black-river.bsc.quiknode.pro/1e43f97a9290a7219de46e1624ae5ad8b03a9b3e/'),
        new Web3('https://silent-black-river.bsc.quiknode.pro/1e43f97a9290a7219de46e1624ae5ad8b03a9b3e/'),
        new Web3('https://silent-black-river.bsc.quiknode.pro/1e43f97a9290a7219de46e1624ae5ad8b03a9b3e/'),
        new Web3('https://silent-black-river.bsc.quiknode.pro/1e43f97a9290a7219de46e1624ae5ad8b03a9b3e/'),
        new Web3('https://silent-black-river.bsc.quiknode.pro/1e43f97a9290a7219de46e1624ae5ad8b03a9b3e/'),
        new Web3('https://silent-black-river.bsc.quiknode.pro/1e43f97a9290a7219de46e1624ae5ad8b03a9b3e/'),
        new Web3('https://silent-black-river.bsc.quiknode.pro/1e43f97a9290a7219de46e1624ae5ad8b03a9b3e/'),
        new Web3('https://silent-black-river.bsc.quiknode.pro/1e43f97a9290a7219de46e1624ae5ad8b03a9b3e/'),
        new Web3('https://silent-black-river.bsc.quiknode.pro/1e43f97a9290a7219de46e1624ae5ad8b03a9b3e/'),
        new Web3('https://silent-black-river.bsc.quiknode.pro/1e43f97a9290a7219de46e1624ae5ad8b03a9b3e/'),
    ],
    TESTNET:[
	    new Web3('https://data-seed-prebsc-2-s3.binance.org:8545/'),
	    // new Web3('https://bsc-dataseed1.defibit.io/'),
	    // new Web3('https://bsc-dataseed1.ninicoin.io/')
    ],
    PRELIVE:[
        new Web3('https://bsc-dataseed.binance.org/'),
        // new Web3('https://bsc-dataseed1.defibit.io/'),
        // new Web3('https://bsc-dataseed1.ninicoin.io/')
    ]
}

module.exports=binanceProvider[process.env.LIVE_NET]
