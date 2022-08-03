import Web3 from 'web3';
import { publicKeyConvert } from 'secp256k1';
import { extractPublicKey } from '@metamask/eth-sig-util'

/**
 * 
 * @returns {Web3} web3 instance
 */
async function getWeb3Instance(){
    // Empty web3 instance
    if (typeof window.ethereum === 'undefined') {
        window.alert("Meta mask is not present");
        return null;
    }
  
    // Instance web3 with the provided information from the MetaMask provider information
    let web3 = new Web3(window.ethereum);
    try {
        // Request account access
        await window.ethereum.enable();
    } catch (e) {
        // Handle user denied access
        return null;
    }

    return web3;
}

export function removeLeading0x(str) {
    if (str.startsWith('0x'))
        return str.substring(2);
    else return str;
}

export function addLeading0x(str) {
    if (!str.startsWith('0x'))
        return '0x' + str;
    else return str;
}

export function uint8ArrayToHex(arr) {
    return Buffer.from(arr).toString('hex');
}

export function hexToUnit8Array(str) {
    return new Uint8Array(Buffer.from(str, 'hex'));
}


export function compress(startsWith04) {

    // add trailing 04 if not done before
    const testBuffer = Buffer.from(startsWith04, 'hex');
    if (testBuffer.length === 64) startsWith04 = '04' + startsWith04;


    return uint8ArrayToHex(publicKeyConvert(
        hexToUnit8Array(startsWith04),
        true
    ));
}


function getUint8ArrayPubKey(data){
    const pubKey = extractPublicKey({
        data: data.data,
        signature: data.signature
    });
    
    const compressedPubKeyHex = compress(pubKey.slice(2));
    return hexToUnit8Array(compressedPubKeyHex)
}

export { getWeb3Instance, getUint8ArrayPubKey };