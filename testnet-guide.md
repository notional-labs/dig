Remember the version is `v1.1.0`. Remember to run both mainnet and testnet on the same machine.
```
cd ~/dig
git checkout v1.1.0
make install
```
1. Init
```
digd init <moniker> --chain-id digtestnet-5 --home ~/.digtestnet
```
2. Download new genesis:
```
wget -O ~/.digtestnet/config/genesis.json https://raw.githubusercontent.com/notional-labs/dig/master/networks/testnets/testnet-5/genesis.json
```
3. Join the testnet with new seeds:
```
digd start --p2p.seeds e1aa4f816fe06b613066772415405ccfe5e58a17@168.119.91.22:1230, 0f91f9bb230150ce056f1f94f088aa776b392406@142.132.196.223:20000 --home ~/.digtestnet
```
4. Generate new keys or restore the existing one;
```
digd keys add <key-name> --home ~/.digtestnet
```
If you have validator address before, add `--recover` flag and type your mnemonic to recover.

Then, go to Faucet channel in Discord to get your token: https://discord.com/channels/873378800199684107/946267035355189248. Send your wallet address to receive tokens.

5. Create validator! 
 ```
 digd tx staking create-validator \
  --amount=1500000000udix \
  --pubkey=$(digd tendermint show-validator) \
  --moniker=<moniker> \
  --chain-id=digtestnet-5 \
  --commission-rate="0.05" \
  --commission-max-rate="0.20" \
  --commission-max-change-rate="0.01" \
  --min-self-delegation=1 \
  --gas 200000 \
  --fees 250000udix \
  --from=<key-name> \
  --home ~/.digtestnet
 ```
