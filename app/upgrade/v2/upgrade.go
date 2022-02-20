package v2

import (
	sdk "github.com/cosmos/cosmos-sdk/types"
	stakingkeeper "github.com/cosmos/cosmos-sdk/x/staking/keeper"
	upgradetypes "github.com/cosmos/cosmos-sdk/x/upgrade/types"

	"github.com/CosmWasm/wasmd/x/wasm"
	wasmtypes "github.com/CosmWasm/wasmd/x/wasm/types"
	"github.com/cosmos/cosmos-sdk/types/module"
)

// Fixes an error where validators can be created with a commission rate
// less than the network minimum rate.
func FixMinCommisionRate(ctx sdk.Context, staking *stakingkeeper.Keeper) {
	// Upgrade every validators min-commission rate
	validators := staking.GetAllValidators(ctx)
	minCommissionRate := staking.GetParams(ctx).MinCommissionRate
	for _, v := range validators {
		if v.Commission.Rate.LT(minCommissionRate) {
			comm, err := staking.MustUpdateValidatorCommission(
				ctx, v, minCommissionRate)
			if err != nil {
				panic(err)
			}
			v.Commission = comm

			// call the before-modification hook since we're about to update the commission
			staking.BeforeValidatorModified(ctx, v.GetOperator())

			staking.SetValidator(ctx, v)
		}
	}
}

func CreateUpgradeHandler(mm *module.Manager, configurator module.Configurator,
	wasmKeeper *wasm.Keeper, staking *stakingkeeper.Keeper,
) upgradetypes.UpgradeHandler {
	return func(ctx sdk.Context, plan upgradetypes.Plan, vm module.VersionMap) (module.VersionMap, error) {
		FixMinCommisionRate(ctx, staking)
		// Set wasm old version to 1 if we want to call wasm's InitGenesis ourselves
		// in this upgrade logic ourselves
		// vm[wasm.ModuleName] = wasm.ConsensusVersion

		// otherwise we run this, which will run wasm.InitGenesis(wasm.DefaultGenesis())
		// and then override it after
		newVM, err := mm.RunMigrations(ctx, configurator, vm)
		if err != nil {
			return newVM, err
		}

		// Since we provide custom DefaultGenesis (privileges StoreCode) in app/genesis.go rather than
		// the wasm module, we need to set the params here when migrating (is it is not customized).

		params := wasmKeeper.GetParams(ctx)
		params.CodeUploadAccess = wasmtypes.AllowNobody
		wasmKeeper.SetParams(ctx, params)

		// override here
		return newVM, err
	}

}
