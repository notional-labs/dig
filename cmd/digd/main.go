package main

import (

	svrcmd "github.com/cosmos/cosmos-sdk/server/cmd"
	"os"
	"github.com/cosmos/cosmos-sdk/server"

	app "github.com/notional-labs/dig/v2/app"
	"github.com/notional-labs/dig/v2/cmd/digd/cmd"
)

func main() {
	rootCmd, _ := cmd.NewRootCmd()

	if err := svrcmd.Execute(rootCmd, app.DefaultNodeHome); err != nil {
		switch e := err.(type) {
		case server.ErrorCode:
			os.Exit(e.Code)

		default:
			os.Exit(1)
		}
	}
}
