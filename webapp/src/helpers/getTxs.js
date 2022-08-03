import axios from "axios";

const api = process.env.REACT_APP_API

export const getTxs = async (address, params) => {
    const URL = `${api}txs?message.sender=${address}&page=${params.page}&limit=${params.limit}`
    const res = await axios.get(URL)
    if(res.status !== 200) return 
    return res.data
}