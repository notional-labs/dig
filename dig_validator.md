Here is how you install dig on Testnet-3 and setup as a validator.

Remember, replace "`validator_name`" by your desired name in these following steps.

# Clone the repo and install

```bash
git clone https://github.com/notional-labs/dig
cd dig/cmd/digd
go install .
export PATH=$PATH:~/go/bin
export GOPATH=~/go
```

# Set up the dig account

If you don't have a validator yet
```
digd keys add validator_name
digd init validator_name --chain-id dig-testnet-3
```

If you have a validator, and want to migrate to your new node
```bash
# To prevent double signing, you should stop the validator node.
digd keys add validator_name --recover
# You will be prompted to type your mnemonic key

# Then, copy content of file `~/.dig/config/priv_validator_key.json` from old machine to new machine, same location.
```

# Start digging

```bash
digd init validator_name -o --chain-id dig-testnet-3

wget -O ~/.dig/config/genesis.json https://cloudflare-ipfs.com/ipfs/QmNMQysuxgQw3JWYyTBuHbw7HyRBbb4L7ShrX6GVRvR2ar

digd keys show validator_name
# This will show detail of your account. Keep them in safe place.

digd start --p2p.persistent_peers d13bb8332dd3b6acdbf5a34c26980e8194b11d7a@95.217.131.55:26656,1a0f4a6ead797ddce80fadf58e0092cbe152c2f8@65.21.74.62:2090
```
# For validators
If you want to check if you are validator or not, run this
```
digd keys show validator_name --bech val
```

If it contains `"digvaloper"`, then you are. If not:
```bash
digd tx staking create-validator --moniker=validator_name --from=validator_name --pubkey="$(digd tendermint show-validator)" --amount="1000000udig" --commission-max-rate="0.10" --commission-max-change-rate="0.05" --commission-rate="0.05" --fees 40000udig --gas 500000 --min-self-delegation 1 --chain-id dig-testnet-3

# You can change the params if you like
```
You can check your balance with:
```bash
digd q bank balances $(digd keys show validator_name -a)
```
If you want to delegate:
```bash
digd tx staking delegate $(digd keys show validator_name --bech val -a) 50000udig --chain-id dig-testnet-3 --from $(digd keys show validator_name -a)

# You can change the params if you like
```

Receive rewards:
```bash
digd tx distribution withdraw-rewards $(digd keys show --bech=val -a validator_name) --from validator_name --gas-prices 0.25udig
```

Receive rewards and commission:
```bash
digd tx distribution withdraw-rewards $(digd keys show --bech=val -a validator_name) --from validator_name --commission --gas-prices 0.25udig
```

Check your validator status with:
```bash
digd status
```

if your validator is jailed, try unjailing it with this:
```bash
digd tx slashing unjail --from=$(digd keys show validator_name -a) --chain-id dig-testnet-3 --gas-prices 50udig
# There is some reasons when your account is jailed, and Jacob are going to change in the next build
```

For RPi users, if you want dig to run in background, create `dig.service` at `/etc/systemd/system/` and edit like this. The parameters are depend on each user, so you can modify to fit your need.
```
[Unit]

Description=Dig Node

After=network.target

[Service]

Type=simple

User=root

WorkingDirectory=/root

ExecStart=/root/go/bin/digd start --p2p.persistent_peers d13bb8332dd3b6acdbf5a34c26980e8194b11d7a@95.217.131.55:26656,1a0f4a6ead797ddce80fadf58e0092cbe152c2f8@65.21.74.62:2090

Restart=on-failure

StartLimitInterval=0

RestartSec=3

LimitNOFILE=65535

LimitMEMLOCK=209715200

[Install]

WantedBy=multi-user.target
```
After that, get dig to work by running:
```bash
systemctl daemon-reload
systemctl enable dig
systemctl start dig
```
You can check if it is running or not by:
```bash
journalctl -u dig -f | grep height
```

This is a guide based on actual install of dig, so some minor errors on the others is inevitable. If you have some problems, create an issue or ask a question in Discord. Thank you!
