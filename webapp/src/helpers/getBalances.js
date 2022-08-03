import axios from 'axios'
import { unbonding } from './transaction'

const api = process.env.REACT_APP_API
// const api = "http://0.0.0.0:1317"
// const api = "https://api-1-dig.notional.ventures"

export const getBalance = async (address) => {
    const URL = `${api}cosmos/bank/v1beta1/balances/${address}`
    let balances = []
    const res= await axios.get(URL)
    if(res.data.balances && res.data.balances.length > 0){
        balances.push([...res.data.balances])   
    }
    return balances
}

export const getDelegation = async (address) => {
    const URL = `${api}cosmos/staking/v1beta1/delegations/${address}`
    const res = await axios.get(URL)
    if (res.status !== 200) return 
    return res.data
}

export const getReward = async (address) => {
    const URL = `${api}cosmos/distribution/v1beta1/delegators/${address}/rewards`
    const res = await axios.get(URL)
    if (res.status !== 200) return 
    return res.data
}

export const getUnbond = async (address) => {
    const URL = `${api}cosmos/staking/v1beta1/delegators/${address}/unbonding_delegations`
    const res = await axios.get(URL)
    if (res.status !== 200) return 
    return res.data
}

export const getTotal = (balances) => {
    let sum = 0
    for (let i of balances){
        sum += parseFloat(i.delegator_shares)
    }
    return sum
}

export const getAsset = async (address) => {
    let promises = []
    promises.push(getBalance(address))
    promises.push(getDelegation(address))
    promises.push(getReward(address))
    promises.push(getUnbond(address))

    const asset = await Promise.all(promises)

    return asset
}

export const getTotalDelegate = (delegations) => {
    let sum = 0
    for (let i of delegations){
        sum += parseFloat(i.delegation.shares)
    }
    return sum
}

export const getTotalUnbonding = (unbondings) => {
    let sum = 0
    for (let i of unbondings){
        for(let j of i.entries) {
            sum += parseFloat(j.balance)
        }
    }
    return sum
}

export const getPrice = async () => {
    const URL = 'https://api.coingecko.com/api/v3/simple/price?ids=dig-chain&vs_currencies=usd'
    const res = await axios.get(URL)
    if(res.status !== 200) return
    return res.data
}

export const convertAsset = (balance, delegation, reward, unbond, usd) => {
    const sum = parseInt(balance) / 1000000
                + parseInt(delegation) / 1000000
                + parseInt(reward) / 1000000
                + parseInt(unbond) / 1000000

    return parseInt(sum * usd)
}


