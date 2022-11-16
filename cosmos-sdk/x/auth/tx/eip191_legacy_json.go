package tx

import (
	"fmt"
	"strconv"

	sdk "github.com/cosmos/cosmos-sdk/types"
	sdkerrors "github.com/cosmos/cosmos-sdk/types/errors"
	signingtypes "github.com/cosmos/cosmos-sdk/types/tx/signing"
	"github.com/cosmos/cosmos-sdk/x/auth/legacy/legacytx"
	"github.com/cosmos/cosmos-sdk/x/auth/signing"
)

const EIP191MessagePrefix = "\x19Ethereum Signed Message:\n"

const eip191LegacyJSONNonCriticalFieldsError = "protobuf transaction contains unknown non-critical fields. This is a transaction malleability issue and SIGN_MODE_EIP191_LEGACY_JSON cannot be used."

var _ signing.SignModeHandler = signModeEIP191LegacyJSONHandler{}

// signModeEIP191LegacyJSONHandler defines the SIGN_MODE_EIP191_LEGACY_JSON
// SignModeHandler.
type signModeEIP191LegacyJSONHandler struct{}

func (s signModeEIP191LegacyJSONHandler) DefaultMode() signingtypes.SignMode {
	return signingtypes.SignMode_SIGN_MODE_EIP191_LEGACY_JSON
}

func (s signModeEIP191LegacyJSONHandler) Modes() []signingtypes.SignMode {
	return []signingtypes.SignMode{signingtypes.SignMode_SIGN_MODE_EIP191_LEGACY_JSON}
}

func (s signModeEIP191LegacyJSONHandler) GetSignBytes(mode signingtypes.SignMode, data signing.SignerData, tx sdk.Tx) ([]byte, error) {
	if mode != signingtypes.SignMode_SIGN_MODE_EIP191_LEGACY_JSON {
		return nil, fmt.Errorf("expected %s, got %s", signingtypes.SignMode_SIGN_MODE_EIP191_LEGACY_JSON, mode)
	}

	protoTx, ok := tx.(*wrapper)
	if !ok {
		return nil, fmt.Errorf("can only handle a protobuf Tx, got %T", tx)
	}

	if protoTx.txBodyHasUnknownNonCriticals {
		return nil, sdkerrors.Wrap(sdkerrors.ErrInvalidRequest, eip191LegacyJSONNonCriticalFieldsError)
	}

	body := protoTx.tx.Body

	if len(body.ExtensionOptions) != 0 || len(body.NonCriticalExtensionOptions) != 0 {
		return nil, sdkerrors.Wrap(sdkerrors.ErrInvalidRequest, "SignMode_SIGN_MODE_EIP191_LEGACY_JSON does not support protobuf extension options.")
	}

	aminoJSONBz := legacytx.StdSignBytes(
		data.ChainID, data.AccountNumber, data.Sequence, protoTx.GetTimeoutHeight(),
		legacytx.StdFee{Amount: protoTx.GetFee(), Gas: protoTx.GetGas()},
		tx.GetMsgs(), protoTx.GetMemo(),
	)

	bz := append(
		[]byte(EIP191MessagePrefix),
		[]byte(strconv.Itoa(len(aminoJSONBz)))...,
	)

	bz = append(bz, aminoJSONBz...)

	return bz, nil
}
