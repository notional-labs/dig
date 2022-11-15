package v2

import (
	sdk "github.com/cosmos/cosmos-sdk/types"
	stakingkeeper "github.com/cosmos/cosmos-sdk/x/staking/keeper"
	upgradetypes "github.com/cosmos/cosmos-sdk/x/upgrade/types"
	icamodule "github.com/cosmos/ibc-go/v3/modules/apps/27-interchain-accounts"
	icacontrollertypes "github.com/cosmos/ibc-go/v3/modules/apps/27-interchain-accounts/controller/types"
	icahosttypes "github.com/cosmos/ibc-go/v3/modules/apps/27-interchain-accounts/host/types"
	icatypes "github.com/cosmos/ibc-go/v3/modules/apps/27-interchain-accounts/types"

	wasmkeeper "github.com/CosmWasm/wasmd/x/wasm/keeper"
	wasmtypes "github.com/CosmWasm/wasmd/x/wasm/types"
	"github.com/cosmos/cosmos-sdk/types/module"

	authkeeper "github.com/cosmos/cosmos-sdk/x/auth/keeper"
	vestingtypes "github.com/cosmos/cosmos-sdk/x/auth/vesting/types"
)

func UnlockAllVestingAccounts(ctx sdk.Context, accKeeper *authkeeper.AccountKeeper) {
	accounts := accKeeper.GetAllAccounts(ctx)
	for _, acc := range accounts {
		vestingAcc, ok := acc.(*vestingtypes.ContinuousVestingAccount)
		if ok {
			accKeeper.SetAccount(ctx, vestingAcc.BaseAccount)
		}
	}
}

func CreateUpgradeHandler(mm *module.Manager, configurator module.Configurator, accKeeper *authkeeper.AccountKeeper, staking *stakingkeeper.Keeper, icaModule icamodule.AppModule, wasmKeeper *wasmkeeper.Keeper) upgradetypes.UpgradeHandler {
	return func(ctx sdk.Context, _ upgradetypes.Plan, fromVM module.VersionMap) (module.VersionMap, error) {
		fromVM[icatypes.ModuleName] = icaModule.ConsensusVersion()
		UnlockAllVestingAccounts(ctx, accKeeper)
		// Set wasm old version to 1 if we want to call wasm's InitGenesis ourselves
		// in this upgrade logic ourselves
		// vm[wasm.ModuleName] = wasm.ConsensusVersion

		// otherwise we run this, which will run wasm.InitGenesis(wasm.DefaultGenesis())
		// and then override it after
		// set the ICS27 consensus version so InitGenesis is not run
		fromVM[icatypes.ModuleName] = mm.Modules[icatypes.ModuleName].ConsensusVersion()
		// create ICS27 Controller submodule params
		controllerParams := icacontrollertypes.Params{
			ControllerEnabled: true,
		}

		newVM, err := mm.RunMigrations(ctx, configurator, fromVM)
		if err != nil {
			return newVM, err
		}

		hostParams := icahosttypes.Params{
			HostEnabled: true,
			AllowMessages: []string{
				"/cosmos.authz.v1beta1.MsgExec",
				"/cosmos.authz.v1beta1.MsgGrant",
				"/cosmos.authz.v1beta1.MsgRevoke",
				"/cosmos.bank.v1beta1.MsgSend",
				"/cosmos.bank.v1beta1.MsgMultiSend",
				"/cosmos.distribution.v1beta1.MsgSetWithdrawAddress",
				"/cosmos.distribution.v1beta1.MsgWithdrawValidatorCommission",
				"/cosmos.distribution.v1beta1.MsgFundCommunityPool",
				"/cosmos.distribution.v1beta1.MsgWithdrawDelegatorReward",
				"/cosmos.feegrant.v1beta1.MsgGrantAllowance",
				"/cosmos.feegrant.v1beta1.MsgRevokeAllowance",
				"/cosmos.gov.v1beta1.MsgVoteWeighted",
				"/cosmos.gov.v1beta1.MsgSubmitProposal",
				"/cosmos.gov.v1beta1.MsgDeposit",
				"/cosmos.gov.v1beta1.MsgVote",
				"/cosmos.staking.v1beta1.MsgEditValidator",
				"/cosmos.staking.v1beta1.MsgDelegate",
				"/cosmos.staking.v1beta1.MsgUndelegate",
				"/cosmos.staking.v1beta1.MsgBeginRedelegate",
				"/cosmos.staking.v1beta1.MsgCreateValidator",
				"/cosmos.vesting.v1beta1.MsgCreateVestingAccount",
				"/ibc.applications.transfer.v1.MsgTransfer",
			},
		}

		// initialize ICS27 module
		icaModule.InitModule(ctx, controllerParams, hostParams)

		// Since we provide custom DefaultGenesis (privileges StoreCode) in app/genesis.go rather than
		// the wasm module, we need to set the params here when migrating (is it is not customized).

		params := wasmKeeper.GetParams(ctx)
		params.CodeUploadAccess = wasmtypes.AllowEverybody
		wasmKeeper.SetParams(ctx, params)

		// override here
		return newVM, err
	}

}
