package test

import (
	"encoding/json"
	"path/filepath"
	"strings"

	"github.com/cosmos/cosmos-sdk/simapp"
	transfertypes "github.com/cosmos/ibc-go/v5/modules/apps/transfer/types"
	clienttypes "github.com/cosmos/ibc-go/v5/modules/core/02-client/types"
	channeltypes "github.com/cosmos/ibc-go/v5/modules/core/04-channel/types"

	ibctesting "github.com/cosmos/ibc-go/v5/testing"
	digapp "github.com/notional-labs/dig/v3/app"
	digparams "github.com/notional-labs/dig/v3/app/params"
	"github.com/stretchr/testify/suite"
	"github.com/tendermint/tendermint/libs/log"
	tmtypes "github.com/tendermint/tendermint/proto/tendermint/types"
	dbm "github.com/tendermint/tm-db"

	sdk "github.com/cosmos/cosmos-sdk/types"

	"testing"
)

func SetupTestingApp() (ibctesting.TestingApp, map[string]json.RawMessage) {
	db := dbm.NewMemDB()
	encCdc := digparams.MakeEncodingConfig(digapp.ModuleBasics)
	app := digapp.NewDigApp(log.NewNopLogger(), db, nil, true, map[int64]bool{}, digapp.DefaultNodeHome, 5, encCdc, simapp.EmptyAppOptions{})
	return app, digapp.NewDefaultGenesisState(app.AppCodec())
}

func TestRelayingPacket(t *testing.T) {
	ibctesting.DefaultTestingAppInit = SetupTestingApp

}

type TransferTestSuite struct {
	suite.Suite

	coordinator *ibctesting.Coordinator

	// testing chains used for convenience and readability
	chainA *ibctesting.TestChain
	chainB *ibctesting.TestChain
	chainC *ibctesting.TestChain
}

func (suite *TransferTestSuite) SetupTest() {
	suite.coordinator = ibctesting.NewCoordinator(suite.T(), 3)
	suite.chainA = suite.coordinator.GetChain(ibctesting.GetChainID(1))
	suite.chainB = suite.coordinator.GetChain(ibctesting.GetChainID(2))
	suite.chainC = suite.coordinator.GetChain(ibctesting.GetChainID(3))
}

func NewTransferPath(chainA, chainB *ibctesting.TestChain) *ibctesting.Path {
	path := ibctesting.NewPath(chainA, chainB)
	path.EndpointA.ChannelConfig.PortID = ibctesting.TransferPort
	path.EndpointB.ChannelConfig.PortID = ibctesting.TransferPort
	path.EndpointA.ChannelConfig.Version = transfertypes.Version
	path.EndpointB.ChannelConfig.Version = transfertypes.Version

	return path
}

// constructs a send from chainA to chainB on the established channel/connection
// and sends the same coin back from chainB to chainA.
func (suite *TransferTestSuite) TestHandleMsgTransfer() {
	// setup between chainA and chainB
	path := NewTransferPath(suite.chainA, suite.chainB)
	suite.coordinator.Setup(path)

	//	originalBalance := suite.chainA.App.(*digapp.DigApp).BankKeeper.GetBalance(suite.chainA.GetContext(), suite.chainA.SenderAccount.GetAddress(), sdk.DefaultBondDenom)
	timeoutHeight := clienttypes.NewHeight(0, 110)

	amount, ok := sdk.NewIntFromString("9223372036854775808") // 2^63 (one above int64)
	suite.Require().True(ok)
	coinToSendToB := sdk.NewCoin(sdk.DefaultBondDenom, amount)

	// send from chainA to chainB
	msg := transfertypes.NewMsgTransfer(path.EndpointA.ChannelConfig.PortID, path.EndpointA.ChannelID, coinToSendToB, suite.chainA.SenderAccount.GetAddress().String(), suite.chainB.SenderAccount.GetAddress().String(), timeoutHeight, 0)
	res, err := suite.chainA.SendMsgs(msg)
	suite.Require().NoError(err) // message committed

	packet, err := ibctesting.ParsePacketFromEvents(res.GetEvents())
	suite.Require().NoError(err)

	// relay send
	err = path.RelayPacket(packet)
	suite.Require().NoError(err) // relay committed

	// check that voucher exists on chain B
	voucherDenomTrace := transfertypes.ParseDenomTrace(transfertypes.GetPrefixedDenom(packet.GetDestPort(), packet.GetDestChannel(), sdk.DefaultBondDenom))
	balance := suite.chainB.App.(*digapp.DigApp).BankKeeper.GetBalance(suite.chainB.GetContext(), suite.chainB.SenderAccount.GetAddress(), voucherDenomTrace.IBCDenom())

	coinSentFromAToB := transfertypes.GetTransferCoin(path.EndpointB.ChannelConfig.PortID, path.EndpointB.ChannelID, sdk.DefaultBondDenom, amount)
	suite.Require().Equal(coinSentFromAToB, balance)

	// setup between chainB to chainC
	// NOTE:
	// pathBtoC.EndpointA = endpoint on chainB
	// pathBtoC.EndpointB = endpoint on chainC
	pathBtoC := NewTransferPath(suite.chainB, suite.chainC)
	suite.coordinator.Setup(pathBtoC)

	// send from chainB to chainC
	msg = transfertypes.NewMsgTransfer(pathBtoC.EndpointA.ChannelConfig.PortID, pathBtoC.EndpointA.ChannelID, coinSentFromAToB, suite.chainB.SenderAccount.GetAddress().String(), suite.chainC.SenderAccount.GetAddress().String(), timeoutHeight, 0)
	res, err = suite.chainB.SendMsgs(msg)
	suite.Require().NoError(err) // message committed

	packet, err = ibctesting.ParsePacketFromEvents(res.GetEvents())
	suite.Require().NoError(err)

	err = pathBtoC.RelayPacket(packet)
	suite.Require().NoError(err) // relay committed

	// NOTE: fungible token is prefixed with the full trace in order to verify the packet commitment
	fullDenomPath := transfertypes.GetPrefixedDenom(pathBtoC.EndpointB.ChannelConfig.PortID, pathBtoC.EndpointB.ChannelID, voucherDenomTrace.GetFullDenomPath())

	coinSentFromBToC := sdk.NewCoin(transfertypes.ParseDenomTrace(fullDenomPath).IBCDenom(), amount)
	balance = suite.chainC.App.(*digapp.DigApp).BankKeeper.GetBalance(suite.chainC.GetContext(), suite.chainC.SenderAccount.GetAddress(), coinSentFromBToC.Denom)

	// check that the balance is updated on chainC
	suite.Require().Equal(coinSentFromBToC, balance)

	// check that balance on chain B is empty
	balance = suite.chainB.App.(*digapp.DigApp).BankKeeper.GetBalance(suite.chainB.GetContext(), suite.chainB.SenderAccount.GetAddress(), coinSentFromBToC.Denom)
	suite.Require().Zero(balance.Amount.Int64())

	// send from chainC back to chainB
	msg = transfertypes.NewMsgTransfer(pathBtoC.EndpointB.ChannelConfig.PortID, pathBtoC.EndpointB.ChannelID, coinSentFromBToC, suite.chainC.SenderAccount.GetAddress().String(), suite.chainB.SenderAccount.GetAddress().String(), timeoutHeight, 0)
	res, err = suite.chainC.SendMsgs(msg)
	suite.Require().NoError(err) // message committed

	packet, err = ibctesting.ParsePacketFromEvents(res.GetEvents())
	suite.Require().NoError(err)

	err = pathBtoC.RelayPacket(packet)
	suite.Require().NoError(err) // relay committed

	balance = suite.chainB.App.(*digapp.DigApp).BankKeeper.GetBalance(suite.chainB.GetContext(), suite.chainB.SenderAccount.GetAddress(), coinSentFromAToB.Denom)

	// check that the balance on chainA returned back to the original state
	suite.Require().Equal(coinSentFromAToB, balance)

	// check that module account escrow address is empty
	escrowAddress := transfertypes.GetEscrowAddress(packet.GetDestPort(), packet.GetDestChannel())
	balance = suite.chainB.App.(*digapp.DigApp).BankKeeper.GetBalance(suite.chainB.GetContext(), escrowAddress, sdk.DefaultBondDenom)
	suite.Require().Equal(sdk.NewCoin(sdk.DefaultBondDenom, sdk.ZeroInt()), balance)

	// check that balance on chain B is empty
	balance = suite.chainC.App.(*digapp.DigApp).BankKeeper.GetBalance(suite.chainC.GetContext(), suite.chainC.SenderAccount.GetAddress(), voucherDenomTrace.IBCDenom())
	suite.Require().Zero(balance.Amount.Int64())
}

func TestTransferTestSuite(t *testing.T) {
	ibctesting.DefaultTestingAppInit = SetupTestingApp

	suite.Run(t, new(TransferTestSuite))
}

func ApplicationDBPathFromRootDir(rootDir string) string {
	return filepath.Join(rootDir, "data", "application.db")
}

func openDB(dbPath string) dbm.DB {
	dbName := strings.Trim(filepath.Base(dbPath), ".db")

	db, err := sdk.NewLevelDB(dbName, filepath.Dir(dbPath))
	if err != nil {
		panic(err)
	}
	return db
}

func TestMigrateIAVLStoreToDBStore(t *testing.T) {
	db := openDB(ApplicationDBPathFromRootDir("/home/catshark/.dig"))
	encCdc := digparams.MakeEncodingConfig(digapp.ModuleBasics)

	app := digapp.NewDigApp(log.NewNopLogger(), db, nil, true, map[int64]bool{}, digapp.DefaultNodeHome, 5, encCdc, simapp.EmptyAppOptions{})
	ctx := app.GetBaseApp().NewContext(false, tmtypes.Header{})

	fungiblePacketData := transfertypes.FungibleTokenPacketData{
		Denom:    "transfer/channel-128/udig",
		Amount:   "7000000",
		Receiver: "dig1j3zmqxrz4dcnw4yeaxuylwkvdc9pnrqd66l0jd",
		Sender:   "osmo1j3zmqxrz4dcnw4yeaxuylwkvdc9pnrqd2495xy",
	}

	packet := channeltypes.NewPacket(
		fungiblePacketData.GetBytes(), 9999, "transfer", "channel-128", "transfer", "channel-1", clienttypes.NewHeight(1, 1), 100,
	)

	app.IBCKeeper.RecvPacket(ctx.Context(), &channeltypes.MsgRecvPacket{Packet: packet, ProofCommitment: nil, ProofHeight: clienttypes.Height{}})
}
