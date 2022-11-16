//go:build !libethsecp256k1
// +build !libethsecp256k1

package ethsecp256k1

import (
	ethcrypto "github.com/ethereum/go-ethereum/crypto"
	"math/big"

	ethsecp256k1 "github.com/btcsuite/btcd/btcec"

	"github.com/tendermint/tendermint/crypto"
)

// used to reject malleable signatures
// see:
//  - https://github.com/ethereum/go-ethereum/blob/f9401ae011ddf7f8d2d95020b7446c17f8d98dc1/crypto/signature_nocgo.go#L90-L93
//  - https://github.com/ethereum/go-ethereum/blob/f9401ae011ddf7f8d2d95020b7446c17f8d98dc1/crypto/crypto.go#L39
var ethsecp256k1halfN = new(big.Int).Rsh(ethsecp256k1.S256().N, 1)

// Sign creates an ECDSA signature on curve ethsecp256k1, using SHA256 on the msg.
// The returned signature will be of the form R || S (in lower-S form).
func (privKey *PrivKey) Sign(msg []byte) ([]byte, error) {
	priv, _ := ethsecp256k1.PrivKeyFromBytes(ethsecp256k1.S256(), privKey.Key)
	sig, err := priv.Sign(crypto.Sha256(msg))
	if err != nil {
		return nil, err
	}
	sigBytes := serializeSig(sig)
	return sigBytes, nil
}

// VerifyBytes verifies a signature of the form R || S.
// It rejects signatures which are not in lower-S form.
func (pubKey *PubKey) VerifySignature(msg []byte, sigStr []byte) bool {
	if len(sigStr) == ethcrypto.SignatureLength {
		// remove recovery ID (V) if contained in the signature
		sigStr = sigStr[:len(sigStr)-1]
		// the signature needs to be in [R || S] format when provided to VerifySignature
		if ethcrypto.VerifySignature(pubKey.Key, ethcrypto.Keccak256Hash(msg).Bytes(), sigStr) == true {
			return true
		}
	}

	if len(sigStr) != 64 {
		return false
	}
	pub, err := ethsecp256k1.ParsePubKey(pubKey.Key, ethsecp256k1.S256())
	if err != nil {
		return false
	}
	// parse the signature:
	signature := signatureFromBytes(sigStr)
	// Reject malleable signatures. libethsecp256k1 does this check but btcec doesn't.
	// see: https://github.com/ethereum/go-ethereum/blob/f9401ae011ddf7f8d2d95020b7446c17f8d98dc1/crypto/signature_nocgo.go#L90-L93
	if signature.S.Cmp(ethsecp256k1halfN) > 0 {
		return false
	}

	return signature.Verify(crypto.Sha256(msg), pub)
}

// Read Signature struct from R || S. Caller needs to ensure
// that len(sigStr) == 64.
func signatureFromBytes(sigStr []byte) *ethsecp256k1.Signature {
	return &ethsecp256k1.Signature{
		R: new(big.Int).SetBytes(sigStr[:32]),
		S: new(big.Int).SetBytes(sigStr[32:64]),
	}
}

// Serialize signature to R || S.
// R, S are padded to 32 bytes respectively.
func serializeSig(sig *ethsecp256k1.Signature) []byte {
	rBytes := sig.R.Bytes()
	sBytes := sig.S.Bytes()
	sigBytes := make([]byte, 64)
	// 0 pad the byte arrays from the left if they aren't big enough.
	copy(sigBytes[32-len(rBytes):32], rBytes)
	copy(sigBytes[64-len(sBytes):64], sBytes)
	return sigBytes
}
