package hd

import (
	bip39 "github.com/cosmos/go-bip39"

	"github.com/cosmos/cosmos-sdk/crypto/keys/secp256k1"
	"github.com/cosmos/cosmos-sdk/crypto/types"

	"github.com/btcsuite/btcd/chaincfg"
	"github.com/btcsuite/btcutil/hdkeychain"
	"github.com/cosmos/cosmos-sdk/crypto/keys/ethsecp256k1"
)

// PubKeyType defines an algorithm to derive key-pairs which can be used for cryptographic signing.
type PubKeyType string

const (
	// MultiType implies that a pubkey is a multisignature
	MultiType = PubKeyType("multi")
	// Secp256k1Type uses the Bitcoin secp256k1 ECDSA parameters.
	Secp256k1Type = PubKeyType("secp256k1")
	// Ed25519Type represents the Ed25519Type signature system.
	// It is currently not supported for end-user keys (wallets/ledgers).
	Ed25519Type = PubKeyType("ed25519")
	// Sr25519Type represents the Sr25519Type signature system.
	Sr25519Type = PubKeyType("sr25519")
	// EthSecp256k1Type defines the ECDSA secp256k1 used on Ethereum
	EthSecp256k1Type = PubKeyType("ethsecp256k1")
)

var (
	// Secp256k1 uses the Bitcoin secp256k1 ECDSA parameters.
	Secp256k1    = secp256k1Algo{}
	EthSecp256k1 = ethSecp256k1Algo{}
)

type DeriveFn func(mnemonic string, bip39Passphrase, hdPath string) ([]byte, error)
type GenerateFn func(bz []byte) types.PrivKey

type WalletGenerator interface {
	Derive(mnemonic string, bip39Passphrase, hdPath string) ([]byte, error)
	Generate(bz []byte) types.PrivKey
}

type secp256k1Algo struct {
}

func (s secp256k1Algo) Name() PubKeyType {
	return Secp256k1Type
}

// Derive derives and returns the secp256k1 private key for the given seed and HD path.
func (s secp256k1Algo) Derive() DeriveFn {
	return func(mnemonic string, bip39Passphrase, hdPath string) ([]byte, error) {
		seed, err := bip39.NewSeedWithErrorChecking(mnemonic, bip39Passphrase)
		if err != nil {
			return nil, err
		}

		masterPriv, ch := ComputeMastersFromSeed(seed)
		if len(hdPath) == 0 {
			return masterPriv[:], nil
		}
		derivedKey, err := DerivePrivateKeyForPath(masterPriv, ch, hdPath)

		return derivedKey, err
	}
}

// Generate generates a secp256k1 private key from the given bytes.
func (s secp256k1Algo) Generate() GenerateFn {
	return func(bz []byte) types.PrivKey {
		var bzArr = make([]byte, secp256k1.PrivKeySize)
		copy(bzArr, bz)

		return &secp256k1.PrivKey{Key: bzArr}
	}
}

type ethSecp256k1Algo struct {
}

// Name returns eth_secp256k1
func (s ethSecp256k1Algo) Name() PubKeyType {
	return EthSecp256k1Type
}

func (s ethSecp256k1Algo) Derive() DeriveFn {
	return func(mnemonic string, bip39Passphrase, hdPath string) ([]byte, error) {
		// Generate a Bip32 HD wallet for the mnemonic and a user supplied password
		seed := bip39.NewSeed(mnemonic, bip39Passphrase)
		// Generate a new master node using the seed.
		masterKey, err := hdkeychain.NewMaster(seed, &chaincfg.MainNetParams)
		if err != nil {
			return nil, err
		}
		// This gives the path: m/44H
		// acc44H, err := masterKey.(hdkeychain.HardenedKeyStart + 44)
		acc44H, err := masterKey.Derive(hdkeychain.HardenedKeyStart + 44)
		if err != nil {
			return nil, err
		}
		// This gives the path: m/44H/60H
		acc44H60H, err := acc44H.Derive(hdkeychain.HardenedKeyStart + 60)
		if err != nil {
			return nil, err
		}
		// This gives the path: m/44H/60H/0H
		acc44H60H0H, err := acc44H60H.Derive(hdkeychain.HardenedKeyStart + 0)
		if err != nil {
			return nil, err
		}
		// This gives the path: m/44H/60H/0H/0
		acc44H60H0H0, err := acc44H60H0H.Derive(0)
		if err != nil {
			return nil, err
		}
		// This gives the path: m/44H/60H/0H/0/0
		acc44H60H0H00, err := acc44H60H0H0.Derive(0)
		if err != nil {
			return nil, err
		}
		btcecPrivKey, err := acc44H60H0H00.ECPrivKey()
		if err != nil {
			return nil, err
		}
		privateKey := btcecPrivKey.ToECDSA()
		// path := "m/44H/60H/0H/0/0"
		derivedKey := privateKey.D.Bytes()
		return derivedKey, err
	}
}

func (s ethSecp256k1Algo) Generate() GenerateFn {
	return func(bz []byte) types.PrivKey {
		var bzArr = make([]byte, ethsecp256k1.PrivKeySize)
		copy(bzArr, bz)
		return &ethsecp256k1.PrivKey{Key: bzArr}
	}
}
