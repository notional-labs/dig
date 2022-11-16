package tx

import (
	"strconv"
	"testing"

	"github.com/stretchr/testify/require"

	cdctypes "github.com/cosmos/cosmos-sdk/codec/types"
	"github.com/cosmos/cosmos-sdk/testutil/testdata"
	sdk "github.com/cosmos/cosmos-sdk/types"
	signingtypes "github.com/cosmos/cosmos-sdk/types/tx/signing"
	"github.com/cosmos/cosmos-sdk/x/auth/legacy/legacytx"
	"github.com/cosmos/cosmos-sdk/x/auth/signing"
)

func TestEIP191LegacyJSONHandler_GetSignBytes(t *testing.T) {
	bldr := newBuilder()
	buildTx(t, bldr)
	tx := bldr.GetTx()

	var (
		chainId        = "test-chain"
		accNum  uint64 = 7
		seqNum  uint64 = 7
	)

	handler := signModeEIP191LegacyJSONHandler{}
	signingData := signing.SignerData{
		ChainID:       chainId,
		AccountNumber: accNum,
		Sequence:      seqNum,
	}
	signBz, err := handler.GetSignBytes(signingtypes.SignMode_SIGN_MODE_EIP191_LEGACY_JSON, signingData, tx)
	require.NoError(t, err)

	aminoJSONBz := legacytx.StdSignBytes(chainId, accNum, seqNum, timeout, legacytx.StdFee{
		Amount: coins,
		Gas:    gas,
	}, []sdk.Msg{msg}, memo)

	expectedSignBz := append(append([]byte(EIP191MessagePrefix), []byte(strconv.Itoa(len(aminoJSONBz)))...), aminoJSONBz...)

	require.Equal(t, expectedSignBz, signBz)

	// expect error with wrong sign mode
	_, err = handler.GetSignBytes(signingtypes.SignMode_SIGN_MODE_LEGACY_AMINO_JSON, signingData, tx)
	require.Error(t, err)

	// expect error with extension options
	bldr = newBuilder()
	buildTx(t, bldr)
	any, err := cdctypes.NewAnyWithValue(testdata.NewTestMsg())
	require.NoError(t, err)
	bldr.tx.Body.ExtensionOptions = []*cdctypes.Any{any}
	tx = bldr.GetTx()
	signBz, err = handler.GetSignBytes(signingtypes.SignMode_SIGN_MODE_EIP191_LEGACY_JSON, signingData, tx)
	require.Error(t, err)

	// expect error with non-critical extension options
	bldr = newBuilder()
	buildTx(t, bldr)
	bldr.tx.Body.NonCriticalExtensionOptions = []*cdctypes.Any{any}
	tx = bldr.GetTx()
	signBz, err = handler.GetSignBytes(signingtypes.SignMode_SIGN_MODE_EIP191_LEGACY_JSON, signingData, tx)
	require.Error(t, err)
}

func TestEIP191LegacyJSONHandler_DefaultMode(t *testing.T) {
	handler := signModeEIP191LegacyJSONHandler{}
	require.Equal(t, signingtypes.SignMode_SIGN_MODE_EIP191_LEGACY_JSON, handler.DefaultMode())
}

func TestEIP191LegacyJSONHandler_Modes(t *testing.T) {
	handler := signModeEIP191LegacyJSONHandler{}
	require.Equal(t, []signingtypes.SignMode{signingtypes.SignMode_SIGN_MODE_EIP191_LEGACY_JSON}, handler.Modes())
}
