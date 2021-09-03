module github.com/notional-labs/dig

go 1.17

require (
	github.com/cosmos/cosmos-sdk v0.44.0
	github.com/ethereum/go-ethereum v1.10.8
	github.com/google/go-cmp v0.5.6 // indirect
	github.com/gorilla/mux v1.8.0
	github.com/spf13/cast v1.4.1
	github.com/tendermint/spm v0.14.0
	github.com/tendermint/tendermint v0.34.12
	github.com/tendermint/tm-db v0.6.4
	google.golang.org/genproto v0.0.0-20210804223703-f1db76f3300d // indirect
)

require (
	github.com/cosmos/ibc-go v1.0.0-beta1
	github.com/prometheus/common v0.30.0 // indirect
	github.com/rs/zerolog v1.24.0 // indirect
	github.com/spf13/cobra v1.2.1 // indirect
	google.golang.org/grpc v1.40.0 // indirect
)

require github.com/improbable-eng/grpc-web v0.14.1 // indirect

replace google.golang.org/grpc => google.golang.org/grpc v1.33.2

replace github.com/tendermint/spm => github.com/faddat/spm v0.44.1

replace github.com/tendermint/tendermint => github.com/tendermint/tendermint v0.34.12

replace github.com/gogo/protobuf => github.com/regen-network/protobuf v1.3.3-alpha.regen.1

replace github.com/cosmos/cosmos-sdk => github.com/notional-labs/cosmos-sdk v0.44.1-0.20210903153730-8096d0c5eda8