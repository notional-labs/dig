KEY="mykey"
CHAINID="test-1"
MONIKER="localtestnet"
KEYALGO="secp256k1"
KEYRING="test"
LOGLEVEL="info"
# to trace evm
#TRACE="--trace"
TRACE=""

# validate dependencies are installed
command -v jq > /dev/null 2>&1 || { echo >&2 "jq not installed. More info: https://stedolan.github.io/jq/download/"; exit 1; }

# remove existing daemon
rm -rf ~/.dig*

make install

digd config keyring-backend $KEYRING
digd config chain-id $CHAINID

# if $KEY exists it should be deleted
digd keys add $KEY --keyring-backend $KEYRING --algo $KEYALGO

# Set moniker and chain-id for Evmos (Moniker can be anything, chain-id must be an integer)
digd init $MONIKER --chain-id $CHAINID 

# Change parameter token denominations to stake
cat $HOME/.dig/config/genesis.json | jq '.app_state["staking"]["params"]["bond_denom"]="stake"' > $HOME/.dig/config/tmp_genesis.json && mv $HOME/.dig/config/tmp_genesis.json $HOME/.dig/config/genesis.json
cat $HOME/.dig/config/genesis.json | jq '.app_state["crisis"]["constant_fee"]["denom"]="stake"' > $HOME/.dig/config/tmp_genesis.json && mv $HOME/.dig/config/tmp_genesis.json $HOME/.dig/config/genesis.json
cat $HOME/.dig/config/genesis.json | jq '.app_state["gov"]["deposit_params"]["min_deposit"][0]["denom"]="stake"' > $HOME/.dig/config/tmp_genesis.json && mv $HOME/.dig/config/tmp_genesis.json $HOME/.dig/config/genesis.json
cat $HOME/.dig/config/genesis.json | jq '.app_state["mint"]["params"]["mint_denom"]="stake"' > $HOME/.dig/config/tmp_genesis.json && mv $HOME/.dig/config/tmp_genesis.json $HOME/.dig/config/genesis.json

# increase block time (?)
cat $HOME/.dig/config/genesis.json | jq '.consensus_params["block"]["time_iota_ms"]="30000"' > $HOME/.dig/config/tmp_genesis.json && mv $HOME/.dig/config/tmp_genesis.json $HOME/.dig/config/genesis.json

# Set gas limit in genesis
cat $HOME/.dig/config/genesis.json | jq '.consensus_params["block"]["max_gas"]="10000000"' > $HOME/.dig/config/tmp_genesis.json && mv $HOME/.dig/config/tmp_genesis.json $HOME/.dig/config/genesis.json

# disable produce empty block
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' 's/create_empty_blocks = true/create_empty_blocks = false/g' $HOME/.dig/config/config.toml
  else
    sed -i 's/create_empty_blocks = true/create_empty_blocks = false/g' $HOME/.dig/config/config.toml
fi

if [[ $1 == "pending" ]]; then
  if [[ "$OSTYPE" == "darwin"* ]]; then
      sed -i '' 's/create_empty_blocks_interval = "0s"/create_empty_blocks_interval = "30s"/g' $HOME/.dig/config/config.toml
      sed -i '' 's/timeout_propose = "3s"/timeout_propose = "30s"/g' $HOME/.dig/config/config.toml
      sed -i '' 's/timeout_propose_delta = "500ms"/timeout_propose_delta = "5s"/g' $HOME/.dig/config/config.toml
      sed -i '' 's/timeout_prevote = "1s"/timeout_prevote = "10s"/g' $HOME/.dig/config/config.toml
      sed -i '' 's/timeout_prevote_delta = "500ms"/timeout_prevote_delta = "5s"/g' $HOME/.dig/config/config.toml
      sed -i '' 's/timeout_precommit = "1s"/timeout_precommit = "10s"/g' $HOME/.dig/config/config.toml
      sed -i '' 's/timeout_precommit_delta = "500ms"/timeout_precommit_delta = "5s"/g' $HOME/.dig/config/config.toml
      sed -i '' 's/timeout_commit = "5s"/timeout_commit = "150s"/g' $HOME/.dig/config/config.toml
      sed -i '' 's/timeout_broadcast_tx_commit = "10s"/timeout_broadcast_tx_commit = "150s"/g' $HOME/.dig/config/config.toml
  else
      sed -i 's/create_empty_blocks_interval = "0s"/create_empty_blocks_interval = "30s"/g' $HOME/.dig/config/config.toml
      sed -i 's/timeout_propose = "3s"/timeout_propose = "30s"/g' $HOME/.dig/config/config.toml
      sed -i 's/timeout_propose_delta = "500ms"/timeout_propose_delta = "5s"/g' $HOME/.dig/config/config.toml
      sed -i 's/timeout_prevote = "1s"/timeout_prevote = "10s"/g' $HOME/.dig/config/config.toml
      sed -i 's/timeout_prevote_delta = "500ms"/timeout_prevote_delta = "5s"/g' $HOME/.dig/config/config.toml
      sed -i 's/timeout_precommit = "1s"/timeout_precommit = "10s"/g' $HOME/.dig/config/config.toml
      sed -i 's/timeout_precommit_delta = "500ms"/timeout_precommit_delta = "5s"/g' $HOME/.dig/config/config.toml
      sed -i 's/timeout_commit = "5s"/timeout_commit = "150s"/g' $HOME/.dig/config/config.toml
      sed -i 's/timeout_broadcast_tx_commit = "10s"/timeout_broadcast_tx_commit = "150s"/g' $HOME/.dig/config/config.toml
  fi
fi

# Allocate genesis accounts (cosmos formatted addresses)
digd add-genesis-account $KEY 100000000000000000000000000stake --keyring-backend $KEYRING

# Sign genesis transaction
digd gentx $KEY 1000000000000000000000stake --keyring-backend $KEYRING --chain-id $CHAINID

# Collect genesis tx
digd collect-gentxs

# Run this to ensure everything worked and that the genesis file is setup correctly
digd validate-genesis

if [[ $1 == "pending" ]]; then
  echo "pending mode is on, please wait for the first block committed."
fi

# Start the node (remove the --pruning=nothing flag if historical queries are not needed)
digd start --pruning=nothing  --minimum-gas-prices=0.0001stake

