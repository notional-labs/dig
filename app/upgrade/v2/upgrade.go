package v2

import (
	sdk "github.com/cosmos/cosmos-sdk/types"
	stakingkeeper "github.com/cosmos/cosmos-sdk/x/staking/keeper"
	upgradetypes "github.com/cosmos/cosmos-sdk/x/upgrade/types"
	icamodule "github.com/cosmos/ibc-go/v3/modules/apps/27-interchain-accounts"
	icacontrollertypes "github.com/cosmos/ibc-go/v3/modules/apps/27-interchain-accounts/controller/types"
	icahosttypes "github.com/cosmos/ibc-go/v3/modules/apps/27-interchain-accounts/host/types"
	icatypes "github.com/cosmos/ibc-go/v3/modules/apps/27-interchain-accounts/types"

	"github.com/cosmos/cosmos-sdk/types/module"
	bankkeeper "github.com/cosmos/cosmos-sdk/x/bank/keeper"

	authkeeper "github.com/cosmos/cosmos-sdk/x/auth/keeper"
	"github.com/cosmos/cosmos-sdk/x/auth/types"
	vestingtypes "github.com/cosmos/cosmos-sdk/x/auth/vesting/types"
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

func UnlockAllVestingAccounts(ctx sdk.Context, accKeeper *authkeeper.AccountKeeper) {
	accounts := accKeeper.GetAllAccounts(ctx)
	for _, acc := range accounts {
		vestingAcc, ok := acc.(*vestingtypes.ContinuousVestingAccount)
		if ok {
			accKeeper.RemoveAccount(ctx, vestingAcc)
			accKeeper.SetAccount(ctx, vestingAcc.BaseAccount)
		}

		baseVestingAcc, ok := acc.(*vestingtypes.BaseVestingAccount)
		if ok {
			accKeeper.RemoveAccount(ctx, baseVestingAcc)
			accKeeper.SetAccount(ctx, baseVestingAcc.BaseAccount)
		}
	}
}

func LockFouderAccount(ctx sdk.Context, accKeeper *authkeeper.AccountKeeper, bank *bankkeeper.BaseKeeper, staking *stakingkeeper.Keeper) {
	var lockAccounts = []string{
		"dig1m9vdgzfqvvjtq8827ft9v5jmavpraw28294quj",
		"dig10c5rjfpkgp35y6klmj6729vhuk7tsnjmxrfa7d",
		"dig14l4g4lvwl0tg6thmpl5q9337drs3he44zp4zzn",
		"dig1mtq24m9c65czcx6qhrp2f2vqd3uw56m7xp7z0u",
		"dig13rmz7zhf8r62g3ufz56jjrkf7uzr2n8n4t4llw",
		"dig1p3ml6vd76yeuq6pqzqyq464my9tyf7elm7fnwz",
		"dig1djs30epmclxpq8c26atryfqjcdk7gwvmsvpand",
		"dig1xd258njuewdhjgs9uzt422sehmdpjfeve50lj9",
		"dig177945lfsutjszzn55snjky9e55y40c8gy6v905",
		"dig1c7r238lhtjm9prgfyw60jpyjkjw8n3jl4vlh7u",
		"dig1y4k43xexpexu062dqh8cj5dyx8dq3qse06v94t",
		"dig1hn54f6dzr753wkyf2vafz5d9kzynvzdwnt4dqz",
	}
	const (
		endTime   = int64(1000000000)
		startTime = int64(1000000000)
	)

	for _, address := range lockAccounts {
		accAddress, err := sdk.AccAddressFromBech32(address)
		if err != nil {
			continue
		}
		ClawbackCoinFromAccount(ctx, accAddress, staking)

		acc := accKeeper.GetAccount(ctx, accAddress)
		accKeeper.RemoveAccount(ctx, acc)

		coins := bank.GetAllBalances(ctx, accAddress)

		bva := vestingtypes.NewBaseVestingAccount(acc.(*types.BaseAccount), coins, endTime)
		newLockAcc := vestingtypes.NewContinuousVestingAccountRaw(bva, startTime)

		accKeeper.SetAccount(ctx, newLockAcc)
	}
}

func ClawbackCoinFromAccount(ctx sdk.Context, accAddr sdk.AccAddress, staking *stakingkeeper.Keeper) {
	now := ctx.BlockHeader().Time

	// this loop will complete all delegator's active redelegations
	for _, activeRedelegation := range staking.GetRedelegations(ctx, accAddr, 65535) {
		// src/dest validator addresses of this redelegation
		redelegationSrc, _ := sdk.ValAddressFromBech32(activeRedelegation.ValidatorSrcAddress)
		redelegationDst, _ := sdk.ValAddressFromBech32(activeRedelegation.ValidatorDstAddress)

		// set all entry completionTime to now so we can complete redelegation
		for i := range activeRedelegation.Entries {
			activeRedelegation.Entries[i].CompletionTime = now
		}

		staking.SetRedelegation(ctx, activeRedelegation)
		_, err := staking.CompleteRedelegation(ctx, accAddr, redelegationSrc, redelegationDst)
		if err != nil {
			panic(err)
		}
	}

	// this loop will turn all delegator's delegations into unbonding delegations
	for _, delegation := range staking.GetAllDelegatorDelegations(ctx, accAddr) {
		validatorValAddr := delegation.GetValidatorAddr()
		_, found := staking.GetValidator(ctx, validatorValAddr)
		if !found {
			continue
		}
		_, err := staking.Undelegate(ctx, accAddr, validatorValAddr, delegation.GetShares()) //nolint:errcheck // nolint because otherwise we'd have a time and nothing to do with it.
		if err != nil {
			panic(err)
		}
	}

	// this loop will complete all delegator's unbonding delegations
	for _, unbondingDelegation := range staking.GetAllUnbondingDelegations(ctx, accAddr) {
		// validator address of this unbonding delegation
		validatorStringAddr := unbondingDelegation.ValidatorAddress
		validatorValAddr, _ := sdk.ValAddressFromBech32(validatorStringAddr)

		// set all entry completionTime to now so we can complete unbonding delegation
		for i := range unbondingDelegation.Entries {
			unbondingDelegation.Entries[i].CompletionTime = now
		}
		staking.SetUnbondingDelegation(ctx, unbondingDelegation)
		_, err := staking.CompleteUnbonding(ctx, accAddr, validatorValAddr)
		if err != nil {
			panic(err)
		}
	}
}

func CreateUpgradeHandler(mm *module.Manager, configurator module.Configurator, accKeeper *authkeeper.AccountKeeper, staking *stakingkeeper.Keeper, bank *bankkeeper.BaseKeeper, icaModule icamodule.AppModule) upgradetypes.UpgradeHandler {
	return func(ctx sdk.Context, _ upgradetypes.Plan, fromVM module.VersionMap) (module.VersionMap, error) {
		fromVM[icatypes.ModuleName] = icaModule.ConsensusVersion()
		UnlockAllVestingAccounts(ctx, accKeeper)
		LockFouderAccount(ctx, accKeeper, bank, staking)
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
			},
		}

		// initialize ICS27 module
		icaModule.InitModule(ctx, controllerParams, hostParams)

		// Since we provide custom DefaultGenesis (privileges StoreCode) in app/genesis.go rather than
		// the wasm module, we need to set the params here when migrating (is it is not customized).

		// override here
		return newVM, err
	}

}
