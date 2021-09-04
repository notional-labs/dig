const {createObjectCsvWriter} = require('csv-writer');
const fs = require('fs');
const csvParser = require('csv-parser');

const abi = [{"inputs":[],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"_toAddress","type":"address"},{"indexed":false,"internalType":"uint256","name":"_reward","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"_sid","type":"uint256"}],"name":"Claim","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"_pid","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"_apy","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"_duration","type":"uint256"}],"name":"NewPool","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"previousOwner","type":"address"},{"indexed":true,"internalType":"address","name":"newOwner","type":"address"}],"name":"OwnershipTransferred","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"account","type":"address"}],"name":"Paused","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"_staker","type":"address"},{"indexed":false,"internalType":"uint256","name":"_pid","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"_sid","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"_amount","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"_stakeFrom","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"_stakeTo","type":"uint256"}],"name":"Stake","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"account","type":"address"}],"name":"Unpaused","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"_pid","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"_apy","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"_duration","type":"uint256"}],"name":"UpdatePool","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"_toAddress","type":"address"},{"indexed":false,"internalType":"uint256","name":"_sid","type":"uint256"}],"name":"Withdraw","type":"event"},{"inputs":[],"name":"DAY_IN_YEAR","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"DFY","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"SECOND_IN_DAY","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"ZOOM","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"admin","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"claim","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"coldWallet","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"emergencyWithdraw","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"minStakeAmount","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"_apy","type":"uint256"},{"internalType":"uint256","name":"_duration","type":"uint256"}],"name":"newPool","outputs":[{"internalType":"uint256","name":"_idx","type":"uint256"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"numberPools","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"}],"name":"numberStakeTime","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"owner","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"pause","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"paused","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"renounceOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_staker","type":"address"},{"internalType":"uint256","name":"_sid","type":"uint256"}],"name":"reward","outputs":[{"internalType":"uint256","name":"_reward","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"_admin","type":"address"}],"name":"setAdmin","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_pid","type":"uint256"},{"internalType":"uint256","name":"_amount","type":"uint256"}],"name":"stake","outputs":[{"internalType":"uint256","name":"_sid","type":"uint256"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"},{"internalType":"uint256","name":"","type":"uint256"}],"name":"stakingData","outputs":[{"internalType":"uint256","name":"balance","type":"uint256"},{"internalType":"uint256","name":"stakeFrom","type":"uint256"},{"internalType":"uint256","name":"pid","type":"uint256"},{"internalType":"uint256","name":"stakeTo","type":"uint256"},{"internalType":"uint256","name":"apy","type":"uint256"},{"internalType":"enum Staking.StakingStatus","name":"status","type":"uint8"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"stakingPools","outputs":[{"internalType":"address","name":"token","type":"address"},{"internalType":"uint256","name":"apy","type":"uint256"},{"internalType":"uint256","name":"duration","type":"uint256"},{"internalType":"enum Staking.PoolStatus","name":"status","type":"uint8"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"_staker","type":"address"}],"name":"totalReward","outputs":[{"internalType":"uint256","name":"_totalReward","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"totalVolume","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"unPause","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_pid","type":"uint256"},{"internalType":"uint256","name":"_apy","type":"uint256"},{"internalType":"uint256","name":"_duration","type":"uint256"},{"internalType":"uint256","name":"_status","type":"uint256"}],"name":"updatePool","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"withdraw","outputs":[],"stateMutability":"nonpayable","type":"function"}];

const bscWeb3 = require("../configs/blockchain/web3");
const {tokenContract} = require("../configs/blockchain/contract");
const numberOfQueue = bscWeb3.length

const resultData = 'collected_data.csv';
const errorData = 'errorCollectWallet.csv';
const pathResult = `./${resultData}`;
const pathErr = `./${errorData}`;

let blockStart = parseInt(process.env.BLOCK_START);
let blockStop = parseInt(process.env.BLOCK_END);

let processedMap = {};
let processingMap = {};

let errorProcessedMap = [];


const csvWriter = createObjectCsvWriter({
    path: pathResult,
    header: [{id: 'wallet', title: 'wallet'}, {id: 'stake', title: 'stake'}, {id: 'balance', title: 'balance'}],
    alwaysQuote: false,
    append: true
})

const csvWriterErr = createObjectCsvWriter({
    path: pathErr,
    header: [{id: 'wallet', title: 'wallet'}],
    alwaysQuote: false,
    append: true
})

async function writeToResultCSV(wallet_address, staking_amount, balance_amount) {
    if(wallet_address in processedMap) {
        return;
    } else {
        processedMap[wallet_address] = {balance: balance_amount, stake: staking_amount};
        let row = [{wallet: wallet_address, stake: staking_amount, balance: balance_amount}]
        await csvWriter.writeRecords(row)
    }
}

async function writeToErrorCSV(wallet_address) {
    if(!errorProcessedMap.includes(wallet_address)) {
        return;
    } else {
        await csvWriterErr.writeRecords([{wallet: wallet_address}])
    }
}

async function readCollectedData(path) {
    const readline = require("readline");
    if(fs.existsSync(path)) {
        const filestream = fs.createReadStream(path);
        const rl = readline.createInterface({
            input: filestream,
            crlfDelay: Infinity
        });

        for await (const line of rl) {
            const data = line.split(",")
            processedMap[data[0]] = {balance: data[2], stake: data[1]}
        }

        filestream.destroy();

        console.log('processedMap successfully');
    }
}

function readErrorData(pathErr) {
    if(fs.existsSync(pathErr)) {
        fs.createReadStream(pathErr)
            .pipe(csvParser())
            .on('data', (data) => {
                errorProcessedMap.push(data.wallet);
            })
            .on('end', () => {
                console.log(errorProcessedMap);
            });
    }
}

function splitToQueue(data) {
    let queueData = {}
    const avgDataLength = data.length / numberOfQueue
    Array.from({ length: numberOfQueue }).forEach((_, index) => {
        queueData[index] = data.slice(Math.floor(index * avgDataLength), Math.floor((index + 1) * avgDataLength))
    })

    return queueData
}

async function processEventBlock(blocks, web3) {
    await processStakingEvent(blocks, web3);
}

async function processStakingEvent(blocks, web3) {
    const stakingContract = new web3.eth.Contract(abi, process.env.STAKING_CONTRACT_ADDRESS, {
        transactionConfirmationBlocks: 1
    })

    console.log('\tScan from ', blocks[0], ' to ', blocks[blocks.length - 1])
    const pastEvents = await stakingContract.getPastEvents('allEvents', {
        fromBlock: blocks[0],
        toBlock: blocks[blocks.length - 1]
    })
    if (pastEvents == null || pastEvents.length == 0) {
        console.log('\tDont have Staking event from ', blocks[0], ' to ', blocks[blocks.length - 1])
        return
    }
    for (const pastEvent of pastEvents) {
        switch (pastEvent['event']) {
            case 'Stake' :
                await queryStakeData(pastEvent, stakingContract);
                break;
        }
    }
}

async function queryStakeData(pastEvent, stakingContract) {
    let wallet = pastEvent.returnValues._staker;
    if (wallet in processedMap || wallet in processingMap) {
        return;
    }

    console.log('handle wallet: ', wallet);
    processingMap[wallet] = 1;
    try {
        if (wallet in processedMap || errorProcessedMap.includes(wallet)) {
            return;
        }

        let stakingAmount = new BigInt(0);
        let rewardAmount = new BigInt(0);
        let balance = new BigInt(0);
        // cần blockStop để lấy tổng số stake tới thời điểm blockStop
        let numberOfStake = await stakingContract.methods.numberStakeTime(wallet).call({}, blockStop);
        for (var sid = 0; sid < numberOfStake; sid ++) {
            // dữ liệu tại thời điểm current block/tức là block cuối cùng
            let stakeData = await stakingContract.methods.stakingData(wallet, sid).call({}, blockStop);
            
            if(stakeData.status == 0) {
                let blockEndData = await bscWeb3[0].eth.getBlock(blockStop); 
                if(stakeData.stakeTo >= blockEndData.timestamp) {
                    stakingAmount = stakingAmount + BigInt(stakeData.balance);
                    // reward tại thời điểm current block/tức là block cuối cùng
                    let reward = await stakingContract.methods.reward(wallet, sid).call({}, blockStop);
                    rewardAmount = rewardAmount + BigInt(reward);
                }
                else {
                    balance = balance + BigInt(stakeData.balance);
                    // reward tại thời điểm current block/tức là block cuối cùng
                    let reward = await stakingContract.methods.reward(wallet, sid).call({}, blockStop);
                    balance = balance + BigInt(reward);
                }
            }
        }
        // Query DFY contract để lấy balance của ví add vào balance
        // balance tính tới thời điểm current block/tức là block cuối cùng
        let balanceTmp = await tokenContract().methods.balanceOf(wallet).call({}, blockStop);
        balance = balance + BigInt(balanceTmp);
        let stakeSum = stakingAmount + rewardAmount;
        //  stakeSum = stakeSum.multipliedBy(1.5) // nếu muốn nhân 1.5 ở stake_amount
        console.log("result: " + wallet + " - " + stakeSum.toFixed() + " - " + balance.toFixed());
        await writeToResultCSV(wallet, stakeSum.toFixed(), balance.toFixed());
    } catch (error) {
        console.log(`error ${wallet}\n`);
        console.log(error);
        if(!errorProcessedMap.includes(wallet)) {
            errorProcessedMap.push(wallet);
            await writeToErrorCSV(wallet);
        }
        
    }
}

async function scan() {
    await readCollectedData(pathResult);

    while (true) {
        try {
            console.log('*************************************************************')
            console.log('\tProcess Binance scan success transactions service at ' + new Date().getTime())

            console.log('Block start: ' + blockStart);

            const blockEnd = Math.min(blockStop, blockStart + 50000);
            console.log('Block end: ' + blockEnd);

            const queueData = splitToQueue(Array.from({length: blockEnd - blockStart}, (_, index) => index + blockStart));

            await Promise.all(
                bscWeb3.map((web3, index) => {
                    return processEventBlock(queueData[index], web3)
                })
            )

            blockStart = blockEnd
            if (blockStart === blockStop) {
                break;
            }
        } catch (e) {
            console.error(e.message)
        }
    };

}

scan();