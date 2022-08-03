import { makeSignDoc } from '@cosmjs/amino';
import { sortedJsonStringify } from '../util';

export function makeSignDocJsonString (msgs, fee, chainId, memo, accountNumber, sequence) {
    return Array.isArray(msgs) ?
     sortedJsonStringify(makeSignDoc([...msgs], fee, chainId, memo, accountNumber, sequence)) 
     : sortedJsonStringify(makeSignDoc([msgs], fee, chainId, memo, accountNumber, sequence)) 
}
