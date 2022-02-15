package v2_test

import (
	"fmt"
	"testing"
	"time"

	sdk "github.com/cosmos/cosmos-sdk/types"
	upgradetypes "github.com/cosmos/cosmos-sdk/x/upgrade/types"
	"github.com/notional-labs/dig/v2/app"
	"github.com/stretchr/testify/suite"
	abci "github.com/tendermint/tendermint/abci/types"
	tmproto "github.com/tendermint/tendermint/proto/tendermint/types"
)

type UpgradeTestSuite struct {
	suite.Suite

	ctx sdk.Context
	app *app.App
}

func (suite *UpgradeTestSuite) SetupTest() {
	cmdapp := app.Setup(false)
	suite.app = cmdapp.(*app.App)
	suite.ctx = suite.app.NewContext(false, tmproto.Header{Height: 1, ChainID: "dig-1", Time: time.Now().UTC()})

}

func TestKeeperTestSuite(t *testing.T) {
	suite.Run(t, new(UpgradeTestSuite))
}

const dummyUpgradeHeight = 5

func (suite *UpgradeTestSuite) TestUpgrade() {
	testCases := []struct {
		msg     string
		update  func()
		expPass bool
	}{
		{
			"Test dig upgrade",
			func() {
				// run upgrade
				suite.ctx = suite.ctx.WithBlockHeight(dummyUpgradeHeight - 1)
				plan := upgradetypes.Plan{Name: "v2", Height: dummyUpgradeHeight}
				err := suite.app.UpgradeKeeper.ScheduleUpgrade(suite.ctx, plan)
				suite.Require().NoError(err)
				plan, exists := suite.app.UpgradeKeeper.GetUpgradePlan(suite.ctx)
				suite.Require().True(exists)
				suite.ctx = suite.ctx.WithBlockHeight(dummyUpgradeHeight)

				suite.Require().NotPanics(func() {
					beginBlockRequest := abci.RequestBeginBlock{}
					suite.app.BeginBlocker(suite.ctx, beginBlockRequest)
				})
			},
			true,
		},
	}

	for _, tc := range testCases {
		suite.Run(fmt.Sprintf("Case %s", tc.msg), func() {
			suite.SetupTest() // reset
			tc.update()
		})
	}
}
