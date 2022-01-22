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
go install -tags rocksdb ./...

# MAKE HOME FOLDER AND GET GENESIS
digd init test --home /sstwo/dig 
cp networks/mainnets/dig-1/genesis.json /sstwo/dig/config

INTERVAL=1000

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
export $(echo $APPNAME)_P2P_LADDR=tcp://0.0.0.0:2220
export $(echo $APPNAME)_RPC_LADDR=tcp://127.0.0.1:2221
export $(echo $APPNAME)_GRPC_ADDRESS=127.0.0.1:2222
export $(echo $APPNAME)_API_ADDRESS=127.0.0.1:2223
export $(echo $APPNAME)_GRPC_WEB_ADDRESS=127.0.0.1:2224
export $(echo $APPNAME)_P2P_SEEDS="37b2839da4463b22a51b1fe20d97992164270eba@62.171.157.192:26656,e2c96b96d4c3a461fb246edac3b3cdbf47768838@65.21.202.37:6969,33f4788e1c6a378b929c66f31e8d253b9fd47c47@194.163.154.251:26656,64eccffdc60a206227032d3a021fbf9dfc686a17@194.163.156.84:26656,be7598b2d56fb42a27821259ad14aff24c40f3d2@172.16.152.118:26656,f446e37e47297ce9f8951957d17a2ae9a16db0b8@137.184.67.162:26656,ab2fa2789f481e2856a5d83a2c3028c5b215421d@144.91.117.49:26656,e9e89250b40b4512237c77bd04dc76c06a3f8560@185.214.135.205:26656,1539976f4ee196f172369e6f348d60a6e3ec9e93@159.69.147.189:26656,85316823bee88f7b05d0cfc671bee861c0237154@95.217.198.243:26656,eb55b70c9fd8fc0d5530d0662336377668aab3f9@185.194.219.128:26656"


digd start --db_backend rocksdb --home /sstwo/dig
