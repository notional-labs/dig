package app

import (
	wasmkeeper "github.com/CosmWasm/wasmd/x/wasm/keeper"
)

const (
	// DefaultInstanceCost is initially set the same as in wasmd.
	DefaultInstanceCost uint64 = 60_000
	// DefaultCompileCost set to a large number for testing.
	DefaultCompileCost uint64 = 100
)

// GasRegisterConfig is defaults plus a custom compile amount.
func GasRegisterConfig() wasmkeeper.WasmGasRegisterConfig {
	gasConfig := wasmkeeper.DefaultGasRegisterConfig()
	gasConfig.InstanceCost = DefaultInstanceCost
	gasConfig.CompileCost = DefaultCompileCost

	return gasConfig
}

func NewWasmGasRegister() wasmkeeper.WasmGasRegister {
	return wasmkeeper.NewWasmGasRegister(GasRegisterConfig())
}
