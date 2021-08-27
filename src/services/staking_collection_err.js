const {createObjectCsvWriter, createObjectCsvStringifier} = require('csv-writer');
const BigNumber = require('bignumber.js');
const fs = require('fs');
const csvParser = require('csv-parser');
let util = require('util');

const bscWeb3 = require("../configs/blockchain/web3");
const {stakingContract, tokenContract} = require("../configs/blockchain/contract");
const numberOfQueue = bscWeb3.length

const resultData = 'collected_data.csv';
const errorData = 'errorCollectWallet.csv';

let processedMap = {};
let errorProcessedMap = [];

const pathResult = `./${resultData}`;
const pathErr = `./${errorData}`;
const csvWriterErr = createObjectCsvWriter({
    path: pathErr,
    header: [{id: 'wallet', title: 'wallet'}],
    alwaysQuote: false,
})

function readCollectedData(path) {
    // Read from result data and issue to a map
    // store data to processedMap
    if(fs.existsSync(path)) {
        fs.createReadStream(path)
            .pipe(csvParser())
            .on('data', (data) => {
                processedMap[data.wallet] = {balance: data.balance, stake: data.stake}
            })
            .on('end', () => {
                console.log("processedMap successfully");
            });
    }
}

// khác
const csvStringifier = createObjectCsvStringifier({
    header: [{id: 'wallet', title: 'wallet'}, {id: 'stake', title: 'stake'}, {id: 'balance', title: 'balance'}],
});
async function writeToResultCSVError(wallet_address, staking_amount, balance_amount) {
    let row = [{wallet: wallet_address, stake: staking_amount, balance: balance_amount}]
    let rowStringfy = await csvStringifier.stringifyRecords(row);
    fs.appendFileSync(pathResult,rowStringfy);
}

async function queryStakeDataWithWalletError(wallet) {
    try {
        if (wallet in processedMap || errorProcessedMap.includes(wallet)) {
            return;
        }

        let stakingAmount = new BigNumber(0);
        let rewardAmount = new BigNumber(0);
        let balance = new BigNumber(0);

        let numberOfStake = await stakingContract.methods.numberStakeTime(wallet).call();
        for (var sid = 0; sid < numberOfStake; sid ++) {
            let stakeData = await stakingContract.methods.stakingData(wallet, sid).call();

            if(stakeData.status == 0) {
                let latest = await bscWeb3[0].eth.getBlockNumber()
                let blockEndData = await bscWeb3[0].eth.getBlock(latest); 
                if(stakeData.stakeTo >= blockEndData.timestamp) {
                    stakingAmount = stakingAmount.plus(new BigNumber(stakeData.balance));
                    reward = await stakingContract.methods.reward(wallet, sid).call();
                    rewardAmount = rewardAmount.plus(new BigNumber(reward));
                }
                else {
                    balance = balance.plus(new BigNumber(stakeData.balance));
                    reward = await stakingContract.methods.reward(wallet, sid).call();
                    balance = balance.plus(new BigNumber(reward));
                }
            }
        }
        // Query DFY contract để lấy balance của ví add vào balance
        balanceTmp = await tokenContract.methods.balanceOf(wallet).call();
        balance = balance.plus(new BigNumber(balanceTmp));
        let stakeSum = stakingAmount.plus(rewardAmount);
        //  stakeSum = stakeSum.multipliedBy(1.5)
        await writeToResultCSVError(wallet, stakeSum.toFixed(), balance.toFixed());
    } catch (error) {
        console.log(error);
        if(!errorProcessedMap.includes(wallet)) {
            errorProcessedMap.push(wallet);
        }
    }
}

async function scanError() {
    readCollectedData(pathResult);
    try {
        if(fs.existsSync(pathErr)) {
            fs.createReadStream(pathErr)
                .pipe(csvParser())
                .on('data', (data) => {
                    console.log("******************************************************\n");
                    if(data.wallet === undefined) {
                        return;
                    }
                    console.log(`scan wallet: ${data.wallet} \n`);
                    queryStakeDataWithWalletError(data.wallet);
                })
                .on('end', () => {
                    csvWriterErr.writeRecords(errorProcessedMap);
                    if(errorProcessedMap.length >0 ){
                        console.log('scan successfully. But has error in ' + errorData);
                    } else {
                        console.log('scan successfully');
                    } 
                });
        }
    } catch (error) {
        console.log(error.message);
    }
}

scanError();