#!/bin/bash
# microtick and bitcanna contributed significantly here.
set -uxe

# set environment variables
# don't use a / after the rpc URL's
# "RPCN == you can put N rpc's here, comma separated list"
export GOPATH=~/go
export PATH=$PATH:~/go/bin
export RPC=https://rpc-1-dig.notional.ventures:443
export RPCN=http://23.88.73.114:46657,http://78.46.174.116:46657
export APPNAME=DIGD

# Install Dig
go mod edit -replace github.com/tendermint/tm-db=github.com/baabeetaa/tm-db@pebble
go mod tidy
go install -ldflags '-w -s -X github.com/cosmos/cosmos-sdk/types.DBBackend=pebbledb -X github.com/tendermint/tm-db.ForceSync=1' -tags pebbledb ./...

# MAKE HOME FOLDER AND GET GENESIS
digd init test
cp networks/mainnets/dig-1/genesis.json ~/.dig/config

INTERVAL=0

# GET TRUST HASH AND TRUST HEIGHT

LATEST_HEIGHT=$(curl -s $RPC/block | jq -r .result.block.header.height);
BLOCK_HEIGHT=$(($LATEST_HEIGHT-$INTERVAL)) 
TRUST_HASH=$(curl -s "$RPC/block?height=$BLOCK_HEIGHT" | jq -r .result.block_id.hash)


# TELL USER WHAT WE ARE DOING
echo "TRUST HEIGHT: $BLOCK_HEIGHT"
echo "TRUST HASH: $TRUST_HASH"


# export state sync vars
export $(echo $APPNAME)_STATESYNC_ENABLE=true
export $(echo $APPNAME)_P2P_MAX_NUM_OUTBOUND_PEERS=100
export $(echo $APPNAME)_P2P_MAX_NUM_INBOUND_PEERS=500
export $(echo $APPNAME)_STATESYNC_RPC_SERVERS="$RPC,$RPCN"
export $(echo $APPNAME)_STATESYNC_TRUST_HEIGHT=$BLOCK_HEIGHT
export $(echo $APPNAME)_STATESYNC_TRUST_HASH=$TRUST_HASH
export $(echo $APPNAME)_P2P_PERSISTENT_PEERS="806a7d30b7646e171edb786d3d47a28a9548b874@142.132.158.36:26656,7c44d441a252fa5d3a910bdc437d711c56328cb4@23.88.73.114:46656,e994ef416d7704d1c7d0d83139e805b3fdfd47d7@65.108.199.222:26776"
export $(echo $APPNAME)_P2P_SEEDS="20e1000e88125698264454a884812746c2eb4807@seeds.lavenderfive.com:16356"


digd start --db_backend pebbledb
