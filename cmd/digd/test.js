/**
 * ECDSA public key recovery from signature
 * @param {Buffer} msgHash
 * @param {Number} v
 * @param {Buffer} r
 * @param {Buffer} s
 * @return {Buffer} publicKey
 */
 exports.ecrecover = function (msgHash, v, r, s) {
    var signature = Buffer.concat([exports.setLength(r, 32), exports.setLength(s, 32)], 64)
    var recovery = v - 27
    if (recovery !== 0 && recovery !== 1) {
      throw new Error('Invalid signature v value')
    }
    var senderPubKey = secp256k1.recover(msgHash, signature, recovery)
    return secp256k1.publicKeyConvert(senderPubKey, false).slice(1)
  }
  