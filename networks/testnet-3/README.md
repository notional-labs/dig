# Dig Testnet 3 Genesis Transactions

Dig Testnet 3 is now accepting genesis transactions!

Genesis submissions end at 10:59:59 +7 GMT, and the network will launch immediately thereafter. 

Testnet 3 features a full state export from the DeFiForYou contracts on Binance Smart Chain, and support for Ethereum-formatted addresses.

We expect to launch mainnet and integrate with dexes shortly after the public testnet-- provided that the test network proves to be stable and secure.


**Before this process, you should add your dfy/dig key like thus**

```bash
# 1. clone dig source code
git clone https://github.com/notional-labs/dig
cd dig
# 2. install dig
go install ./...
# 3. name your node and write configuration to ~/.dig
digd init moniker
# 
# IF you get an error that 'digd not found' then your gopath is not setup properly.
# You can try:
# export GOPATH=~/go
# export PATH=$PATH:~/go/bin
#
# 4. put genesis.json in place
cp networks/testnet-3/genesis.json ~/.dig/config
# 5. define the amount you want to stake
digd gentx keyname 100000udig --chain-id dig-testnet-3
#
cp ~/.dig/config/gentx/* networks/testnet-3/
```


## Note Well Please
* THIS IS A TESTNET, AND THE STATE OF GENESIS CAN/MAY/WILL CHANGE BEFORE MAINNET
  * For example, we've added 100m to ensure that consensus gets rolling and will take that out for mainnet.
* NEVER, EVER SHOW ANYONE YOUR SEED PHRASE
  * 
