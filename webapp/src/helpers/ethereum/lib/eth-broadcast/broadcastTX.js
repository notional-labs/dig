import { makeSignDocJsonString } from "../eth-transaction/Sign"
import { makeAuthInfoBytes, makeEthPubkeyFromByte} from "../eth-transaction/Auth";
import { getUint8ArrayPubKey } from "../metamaskHelpers";
import { makeRawTxBytes, makeTxBodyBytes} from "../eth-transaction/Tx"
import { fetchAccount} from './fetch'
import {coins} from "@cosmjs/stargate"
import { StargateClient } from "@cosmjs/stargate";
import { notification} from "antd"


function fromHexString (hexString){
  if (hexString.slice(0,2) == "0x") {
    return Uint8Array.from(Buffer.from(hexString.slice(2), 'hex'));
  }
  return Uint8Array.from(Buffer.from(hexString, 'hex'));
}

export const broadcastTransaction = async (address, msg, signDocMsg, chainId, memo, gasLimit, web3, UIProcessing = null) => {
  const denom = process.env.REACT_APP_DENOM

  let stdFeeToPutIntoSignDoc = {
    amount: coins(15000, `${denom}`),
    gas: gasLimit.toString(),
  };

  let fee = {
      amount : coins(15000, `${denom}`),
      gasLimit: gasLimit.toString(),
    }
  console.log(address)
  const accountOnChain = await fetchAccount(address)
  console.log(accountOnChain)
  

  const signDocJsonString = makeSignDocJsonString(signDocMsg, stdFeeToPutIntoSignDoc, chainId, memo, accountOnChain.accountNumber, accountOnChain.sequence) 
  console.log(signDocJsonString)
  const params = [address, signDocJsonString];
  const method = 'personal_sign';

  var pubKeyBytes = null;
  var signature_metamask = null;

  web3.currentProvider.send(
    {
      method,
      params,
      address,
    },
    function(err, result){
        if (result.error) {
          alert(result.error.message);
        }
        if (result.error) return console.error('ERROR', result);

        // get pubKey bytes
        pubKeyBytes = getUint8ArrayPubKey({
          data: signDocJsonString,
          signature: result.result
        })
        signature_metamask = result.result
      }
    ).then(() => {
      const ethPubKey = makeEthPubkeyFromByte(pubKeyBytes)
      const bodyBytes = makeTxBodyBytes(msg, memo)
      console.log("ethPubByte", ethPubKey)
      const authInfoBytes = makeAuthInfoBytes(fee, ethPubKey, 191, accountOnChain.sequence)
      const signature = fromHexString(signature_metamask)
      signature[64] = 0 
      console.log("signature", signature )
      const txRawBytes = makeRawTxBytes(authInfoBytes, bodyBytes, [signature])
        StargateClient.connect(process.env.REACT_APP_RPC).then(
          (broadcaster) => {
            broadcaster.broadcastTx(
              Uint8Array.from(txRawBytes)
            ).then(
              (data)=>{
                UIProcessing();
                console.log(data)
                if (data.code == 0){
                  notification.success({
                    message: "Success send transaction. Tx hash : " +  data.transactionHash.toString(),
                    duration: 3
                })
                return "Success send transaction"
                }else{
                  notification.error({
                    message: "Transaction Failed ",
                    description: data.rawLog
                })
                return "Transaction Failed"

                }
              }
            );
          }
        );
    }).catch(e =>  {
      notification.error({
        message: "Transaction Rejected " ,
        description: e.message
    })
    return "Transaction Rejected"
    })

  

  
}
