package app

import (
	"encoding/json"
	"os"

	"github.com/CosmWasm/wasmd/app"
	"github.com/cosmos/cosmos-sdk/simapp"
	sdk "github.com/cosmos/cosmos-sdk/types"
	"github.com/tendermint/spm/cosmoscmd"
	abci "github.com/tendermint/tendermint/abci/types"
	"github.com/tendermint/tendermint/libs/log"
	dbm "github.com/tendermint/tm-db"
)

// Setup initializes a new DigApp
func Setup(isCheckTx bool) cosmoscmd.App {
	db := dbm.NewMemDB()
	encCdc := cosmoscmd.MakeEncodingConfig(app.ModuleBasics)

	digapp := NewDigApp(log.NewNopLogger(), db, nil, true, map[int64]bool{}, DefaultNodeHome, 5, encCdc, simapp.EmptyAppOptions{})
	if !isCheckTx {
		genesisState := NewDefaultGenesisState(encCdc.Marshaler)
		stateBytes, err := json.MarshalIndent(genesisState, "", " ")
		if err != nil {
			panic(err)
		}

		digapp.InitChain(
			abci.RequestInitChain{
				Validators:      []abci.ValidatorUpdate{},
				ConsensusParams: simapp.DefaultConsensusParams,
				AppStateBytes:   stateBytes,
			},
		)
	}

	return digapp
}

// SetupTestingAppWithLevelDb initializes a new App intended for testing,
// with LevelDB as a db
func SetupTestingAppWithLevelDb(isCheckTx bool) (digapp cosmoscmd.App, cleanupFn func()) {
	dir := "dig_test"
	encCdc := cosmoscmd.MakeEncodingConfig(app.ModuleBasics)

	db, err := sdk.NewLevelDB("osmosis_leveldb_testing", dir)
	if err != nil {
		panic(err)
	}
	digapp = NewDigApp(log.NewNopLogger(), db, nil, true, map[int64]bool{}, DefaultNodeHome, 5, encCdc, simapp.EmptyAppOptions{})
	if !isCheckTx {
		genesisState := NewDefaultGenesisState(encCdc.Marshaler)
		stateBytes, err := json.MarshalIndent(genesisState, "", " ")
		if err != nil {
			panic(err)
		}

		digapp.InitChain(
			abci.RequestInitChain{
				Validators:      []abci.ValidatorUpdate{},
				ConsensusParams: simapp.DefaultConsensusParams,
				AppStateBytes:   stateBytes,
			},
		)
	}

	cleanupFn = func() {
		db.Close()
		err = os.RemoveAll(dir)
		if err != nil {
			panic(err)
		}
	}

	return
}
