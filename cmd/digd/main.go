package main

import (
	"os"

	"github.com/cosmos/cosmos-sdk/server"
	svrcmd "github.com/cosmos/cosmos-sdk/server/cmd"

	app "github.com/notional-labs/dig/v3/app"
	"github.com/notional-labs/dig/v3/cmd/digd/cmd"
)

func main() {
	rootCmd, _ := cmd.NewRootCmd()
	if err := svrcmd.Execute(rootCmd, "DIGD", app.DefaultNodeHome); err != nil {
		switch e := err.(type) { //nolint:errorlint // this is how we do it...
		case server.ErrorCode:
			os.Exit(e.Code)

		default:
			os.Exit(1)
		}
	}
}
