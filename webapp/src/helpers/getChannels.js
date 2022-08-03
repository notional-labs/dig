import axios from "axios";

export const getChannels = async() => {
    const URL = `https://api-1-dig.notional.ventures/ibc/core/channel/v1/channels?pagination.limit=1000`
    const res = await axios.get(URL)
    if ( res.status !== 200) return
    return res.data
}

export const getClientState = async(channel_id) => {
    const URL = `https://api-1-dig.notional.ventures/ibc/core/channel/v1/channels/${channel_id}/ports/transfer/client_state`
    const res = await axios.get(URL)
    if ( res.status !== 200) return
    return res.data
}