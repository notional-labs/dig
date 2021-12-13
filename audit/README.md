# Audit 12/13/21


# Genesis.json spot checks: Ricardo

### Spot check Blurt airdrop
cosmos1s2zlg0w25x2uzla8py2fqwgkfp5xas3lwepnts as per supplied airdrop .csv should have airdrop of 265510.05094435 DIG
The related Dig address is dig1s2zlg0w25x2uzla8py2fqwgkfp5xas3lkdgcft, genesis.json has 265510050944 udig which is a perfect match.
Also searched for duplicate amount and address and no duplicate found.

@thecryptodrive 13/12/2021 

### Spot check Validator allocations
Checked dig1wd02ktcvpananlvd9u6jm3x3ap3vmw59rhen8u with required allocation of 675372 DIG, address exists on genesis.json with amount
675372278571 udig =  675372 DIG and there are no duplicates on address.

@thecryptodrive 13/12/2021 


# Epochs

The epoch module was at the end of 

```go
	app.mm.SetOrderInitGenesis(
		capabilitytypes.ModuleName,
		authtypes.ModuleName,
		banktypes.ModuleName,
		distrtypes.ModuleName,
		stakingtypes.ModuleName,
		slashingtypes.ModuleName,
		govtypes.ModuleName,
		minttypes.ModuleName,
		crisistypes.ModuleName,
		ibchost.ModuleName,
		genutiltypes.ModuleName,
		evidencetypes.ModuleName,
		ibctransfertypes.ModuleName,
		epochstypes.ModuleName,
		// this line is used by starport scaffolding # stargate/app/initGenesis
	)
```
So it also needed to be at the end of genesis.json.  The genesis file now comes outy valid, but the genesis balance is still too high. This is resolved in commit 

```
commit a90e321783e970e22775bc081695b7c1c7f73801
Author: Jacob Gadikian <jacobgadikian@gmail.com>
Date:   Mon Dec 13 06:54:47 2021 +0700

    Epochs needed to be at the end of genesis.json (per position in app.go)
```



# Genesis.json git history: Jacob

Going through git history to ensure that we didn't miss any balance changes in pull requests.  