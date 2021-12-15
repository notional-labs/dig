# Guide to set up a full node and create validator for dig mainnet

Replace `<name>` with your desired name.

## Clone the repo and install

```bash
git clone https://github.com/notional-labs/dig
cd dig/
git checkout master
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

digd start --p2p.seeds 37b2839da4463b22a51b1fe20d97992164270eba@62.171.157.192:26656,e2c96b96d4c3a461fb246edac3b3cdbf47768838@65.21.202.37:6969 --p2p.persistent_peers 33f4788e1c6a378b929c66f31e8d253b9fd47c47@194.163.154.251:26656,64eccffdc60a206227032d3a021fbf9dfc686a17@194.163.156.84:26656,be7598b2d56fb42a27821259ad14aff24c40f3d2@172.16.152.118:26656,f446e37e47297ce9f8951957d17a2ae9a16db0b8@137.184.67.162:26656,ab2fa2789f481e2856a5d83a2c3028c5b215421d@144.91.117.49:26656,e9e89250b40b4512237c77bd04dc76c06a3f8560@185.214.135.205:26656,1539976f4ee196f172369e6f348d60a6e3ec9e93@159.69.147.189:26656,85316823bee88f7b05d0cfc671bee861c0237154@95.217.198.243:26656,eb55b70c9fd8fc0d5530d0662336377668aab3f9@185.194.219.128:26656
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
