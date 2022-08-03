import { Any } from "cosmjs-types/google/protobuf/any";
import { PubKey } from "cosmjs-types/cosmos/crypto/secp256k1/keys";
import Long from "long";
import {SignerInfo, AuthInfo} from "cosmjs-types/cosmos/tx/v1beta1/tx";
import { fromBase64, toBase64 } from "@cosmjs/encoding";


export function makeEthPubkeyFromByte(pubkeybytes) {
  const pubkeyProto = PubKey.fromPartial({
    key: pubkeybytes,
  });
  return Any.fromPartial({
    typeUrl: "/cosmos.crypto.ethsecp256k1.PubKey",
    value: Uint8Array.from(PubKey.encode(pubkeyProto).finish()),
  });
}

export function makeAuthInfoBytes (fee, pubkey, mode, sequence) {
    const signerInfo = SignerInfo.fromPartial({
        publicKey: pubkey,
        modeInfo: {
          single: {
            mode: mode ,
          },
        },
        sequence: Long.fromNumber(sequence),
    });

    const authInfo = AuthInfo.fromPartial({
        signerInfos: [signerInfo],
        fee: fee,
        
    })

    return AuthInfo.encode(authInfo).finish()
}