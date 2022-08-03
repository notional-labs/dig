import { SigningCosmosClient } from "@cosmjs/launchpad";
import { digChain, digTest } from '../chainObj';
import {
    SigningStargateClient,
} from "@cosmjs/stargate";
// import { MsgDelegate } from "@cosmjs/stargate/build/codec/cosmos/staking/v1beta1/tx";

export const getKeplr = async () => {
    if (!window.getOfflineSigner || !window.keplr) {
        alert("Keplr Wallet not detected, please install extension");
        return {
            accounts: null
        }
    } else {
        await window.keplr.experimentalSuggestChain(digTest)
        await window.keplr.enable(process.env.REACT_APP_CHAIN_ID)
        const offlineSigner = window.keplr.getOfflineSigner(process.env.REACT_APP_CHAIN_ID);
        const key = await window.keplr.getKey(process.env.REACT_APP_CHAIN_ID)
        const accounts = await offlineSigner.getAccounts();
        accounts.chain = process.env.REACT_APP_CHAIN_ID
        return {
            accounts,
            offlineSigner,
            key
        };
    }
}

export const addDig = async () => {
    if (!window.getOfflineSigner || !window.keplr) {
        alert("Keplr Wallet not detected, please install extension");
        return undefined
    } else {
        await window.keplr.experimentalSuggestChain(digChain)
    }
}

export const getCosmosClient = (address, offlineSigner) => {
    const URL = process.env.REACT_APP_API
    const cosmJS = new SigningCosmosClient(
        URL,
        address,
        offlineSigner,
    );
    return cosmJS;
}

export const getStargateClient = async (signer) => {
    const rpcEndpoint = process.env.REACT_APP_RPC;
    const client = await SigningStargateClient.connectWithSigner(rpcEndpoint, signer);
    return client
} 

export const getKeplr2 = async () => {
    if (!window.getOfflineSigner || !window.keplr) {
        alert("Keplr Wallet not detected, please install extension");
        return undefined
    } else {
        await window.keplr.experimentalSuggestChain(digChain)
        await window.keplr.enable(process.env.REACT_APP_CHAIN_ID)
        const signer = window.getOfflineSignerOnlyAmino(process.env.REACT_APP_CHAIN_ID);
        return signer
    }
}

export const getClient = async () => {
    const signer = await getKeplr2()
    const rpcEndpoint = process.env.REACT_APP_RPC;
    const client = await SigningStargateClient.connectWithSigner(rpcEndpoint, signer)
    return client
}
