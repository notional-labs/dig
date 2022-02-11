package v2

import (
	sdk "github.com/cosmos/cosmos-sdk/types"
	govkeeper "github.com/cosmos/cosmos-sdk/x/gov/keeper"
	stakingkeeper "github.com/cosmos/cosmos-sdk/x/staking/keeper"
)

func RunForkLogic(ctx sdk.Context, gov *govkeeper.Keeper, staking *stakingkeeper.Keeper) {
	ctx.Logger().Info("Applying Osmosis v3 upgrade." +
		" Fixing governance deposit so proposals can be voted upon," +
		" and fixing validator min commission rate.")
	FixMinCommisionRate(ctx, staking)
}

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
