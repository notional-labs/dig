//get genesis file here 
const genesis = require('./genesis.json')

let sum = 0

//add total sum for all amount on balances
for (let i of genesis.app_state.bank.balances){
    if (i.coins && i.coins[0].amount){
        sum += parseInt(i.coins[0].amount)
    }
}

console.log(sum)

//add total sum for all amount on vesting account 
// for (let i of genesis.app_state.auth.accounts){
//     if (i.base_vesting_account){
//         sum += parseInt(i.base_vesting_account.original_vesting[0].amount)
//     }
// }

// console.log(sum)