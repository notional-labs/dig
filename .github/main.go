package main

import (
	"encoding/hex"
	"fmt"
	"strconv"

	"github.com/cosmos/cosmos-sdk/crypto/keys/ethsecp256k1"
	sdk "github.com/cosmos/cosmos-sdk/types"
	"github.com/cosmos/cosmos-sdk/x/auth/legacy/legacytx"
	banktypes "github.com/cosmos/cosmos-sdk/x/bank/types"
	"github.com/ethereum/go-ethereum/crypto"
)

type HJ struct {
	I string
}

const EIP191MessagePrefix = "\x19Ethereum Signed Message:\n"

func signHash(data []byte) []byte {
	msg := fmt.Sprintf("\x19Ethereum Signed Message:\n%d%s", len(data), data)
	fmt.Println(msg)
	return crypto.Keccak256([]byte(msg))
}

func main() {
	msgs := &banktypes.MsgSend{
		FromAddress: "0x5050A4F4b3f9338C3472dcC01A87C76A144b3c9c",
		ToAddress:   "dig166tktdgrzk8d7kl03ymm046v7jxma5cuvpa6g0",
		Amount:      sdk.NewCoins(sdk.NewCoin("stake", sdk.NewInt(9))),
	}
	// msgs = msgs.(sdk.Msg)
	// validate type and equality
	aminoJSONBz := legacytx.StdSignBytes(
		"test-1", 0, 0, 0,
		legacytx.StdFee{Amount: sdk.NewCoins(sdk.NewCoin("stake", sdk.NewInt(200000))), Gas: 200000},
		[]sdk.Msg{msgs}, "",
	)

	bz := append(
		[]byte(EIP191MessagePrefix),
		[]byte(strconv.Itoa(len(aminoJSONBz)))...,
	)

	bz = append(bz, aminoJSONBz...)

	// writer := os.Stdout

	// // _, err := writer.Write(bz)
	// if err != nil {
	// 	panic(err)
	// }
	test, _ := hex.DecodeString("19457468657265756d205369676e6564204d6573736167653a0a3331327b226163636f756e745f6e756d626572223a2230222c22636861696e5f6964223a22746573742d31222c22666565223a7b22616d6f756e74223a5b5d2c22676173223a22323030303030227d2c226d656d6f223a22222c226d736773223a5b7b2274797065223a22636f736d6f732d73646b2f4d736753656e64222c2276616c7565223a7b22616d6f756e74223a5b7b22616d6f756e74223a2239222c2264656e6f6d223a227374616b65227d5d2c2266726f6d5f61646472657373223a22307866623932613430333939313936316133313031363937646364376131393066636633616536376636222c22746f5f61646472657373223a22307866623932613430333939313936316133313031363937646364376131393066636633616536376636227d7d5d2c2273657175656e6365223a223135227d")

	key := make([]byte, 32)
	for i := range key {
		key[i] = 2
	}

	privKey := ethsecp256k1.PrivKey{
		Key: key,
	}
	fmt.Println(privKey.PubKey().Bytes())

	// msg := []byte("hello world")
	// sigHash := ethcrypto.Keccak256Hash(msg)
	// expectedSig, err := secp256k1.Sign(sigHash.Bytes(), privKey.Bytes())

	bz3 := signHash(aminoJSONBz)

	sigTest, _ := privKey.Sign(test)
	fmt.Println(hex.EncodeToString(sigTest))

	sig2, _ := privKey.Sign(bz)
	sig3, err := privKey.Sign(bz3)
	if err != nil {
		panic(err)
	}
	fmt.Println(hex.EncodeToString(sig2)+"\n", hex.EncodeToString(sig3))

}

//  8501f44f539bb82a491be0c16cc288f4b66986bfe2c9e5cd4bf4d1201561fe8815f83757574079c5a2cce427e27091c5ebf58193493a3d5a5587c67daaa72a2600
//0x8501f44f539bb82a491be0c16cc288f4b66986bfe2c9e5cd4bf4d1201561fe8815f83757574079c5a2cce427e27091c5ebf58193493a3d5a5587c67daaa72a261b
//41a5f0c14a84de8f197c5f46623f3b6a7a5cd4ac21c71aff425072c33f6babbd21579ec8ec5c7135f3c14258734f7b1559324c5277ce5ae5ecf36bc748a6019601
//064b11e8d1188342e4d51316db513373fd8699e853f460e55e11ca8554bd9f2b7e88e7c3f55b9e3102b9c8a72c648dabc8dad32de73c48e01a79641e1c13313000
//a61bd6aefb88bbe25fc62565318f32c31ab3b899ef19b739baf9bc8748756c087d4dc6b6413b475253cc55601e408d28a7b8f41f13d882af7379857b53d1851400
//a61bd6aefb88bbe25fc62565318f32c31ab3b899ef19b739baf9bc8748756c087d4dc6b6413b475253cc55601e408d28a7b8f41f13d882af7379857b53d1851400
