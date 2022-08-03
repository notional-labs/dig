import { Registry } from "@cosmjs/proto-signing";
import { TxBody, TxRaw } from "cosmjs-types/cosmos/tx/v1beta1/tx";
import Long from "long";
import { defaultRegistryTypes } from "@cosmjs/stargate";



// export function makeTxBodyBytes(msg, memo, timeoutheight) {
//     const txBody = TxBody.fromPartial({
//         messages: [msg],
//         memo: memo,
//         timeoutHeight: Long.fromNumber(timeoutheight),
//         extensionOptions: [],
//         nonCriticalExtensionOptions: [],
//     })
//     return TxBody.encode(txBody).finish()
// }

export function makeRawTxBytes(authInfoBytes, bodyBytes, signatures) {
    const txRaw = TxRaw.fromPartial({
        authInfoBytes: authInfoBytes,
        bodyBytes: bodyBytes,
        signatures: signatures
    });
    return TxRaw.encode(txRaw).finish()
}

export function makeTxBodyBytes(msg, memo) {
  const registry = new Registry(defaultRegistryTypes)

  let txBodyFields = {
    typeUrl: "/cosmos.tx.v1beta1.TxBody",
    value: {
      messages: [
        msg
      ],
      memo: memo,
    },
  };
  const txBodyBytes = registry.encode(txBodyFields);
  return txBodyBytes

}