import { keccak } from 'ethereumjs-util';
import EC from "elliptic";
import CryptoJS from "crypto-js";

import { Buffer } from "buffer/";
    
export const pubkeyToAddress = async(pubKey, address, type) => {
    if (type == "eth") {
        let pubKeyBuffer = Buffer.from(publicKeyConvert(this.pubKey, false).slice(1))

        assert(pubKeyBuffer.length === 64)
            // Only take the lower 168bits of the hash, the last 8 bits (1 byte) indicate that this is an eth address
        let address = new Uint8Array(21)
        address.set(keccak(pubKeyBuffer).slice(-20), 0)
        return address
    } else {



    }

}

export const getCosmosClient = (accounts, offlineSigner) => {
    const URL = "http://65.21.202.37:8001"
    const cosmJS = new SigningCosmosClient(
        URL,
        accounts[0].address,
        offlineSigner,
    );
    return cosmJS;
}