# Guide to set up a full node and create validator for dig mainnet

Replace `<name>` with your desired name.

## Clone the repo and install

```bash
git clone https://github.com/notional-labs/dig
cd dig/
git checkout v1.0.0
go install ./...
cd ~
export PATH=$PATH:~/go/bin
export GOPATH=~/go
```

## Key
Generate a new key:
```
digd keys add <keyname>
```

If you already have a key or a validator, skip the creat-validator step and do:
```bash
# To prevent double signing, you should stop the validator node.
digd keys add <keyname> --recover
# Insert you mnemonic seed.

# Then move the ~/.dig/config/priv_validator_key.json file from your old validating machine to the new one, same location.
```

## Running the node

```bash
digd init <nodename> --chain-id dig-1

wget -O ~/.dig/config/genesis.json https://github.com/notional-labs/dig/raw/master/networks/mainnets/dig-1/genesis.json

digd keys show validator_name
# This will show detail of your account. Keep them in safe place.

digd start
```
## Create-validator
To check the validator operating address:
```
digd keys show <keyname> -a --bech val
```

Creating validator:
```bash
digd tx staking create-validator --moniker <validatorname> --from <keyname> --pubkey="$(digd tendermint show-validator)" --amount="1000000udig" --commission-max-rate="0.10" --commission-max-change-rate="0.05" --commission-rate="0.05" --min-self-delegation 1 --chain-id dig-1

# Customize the params as you want
```

Claim rewards:
```bash
digd tx distribution withdraw-rewards $(digd keys show --bech=val -a <keyname>) --from <keyname> --chain-id dig-1
```

Claim rewards and commission as a validator:
```bash
digd tx distribution withdraw-rewards $(digd keys show --bech=val -a <keyname>) --from <keyname> --chain-id dig-1 --commission
```

Check your node's status:
```bash
digd status
```

If the validator is jailed, try unjailing it with:
```bash
digd tx slashing unjail --from=$(digd keys show <keyname> -a) --chain-id dig-1 --fees 200000udig --gas 200000
```
