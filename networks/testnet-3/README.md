# Dig Testnet 3 Genesis Transactions

Dig Testnet 3 is now accepting genesis transactions!

Genesis submissions end at 10:59:59 +7 GMT, and the network will launch immediately thereafter. 

Testnet 3 features a full state export from the DeFiForYou contracts on Binance Smart Chain, and support for Ethereum-formatted addresses.

We expect to launch mainnet and integrate with dexes shortly after the public testnet-- provided that the test network proves to be stable and secure.


**Before this process, you should add your dfy/dig key like thus**

These instructions assume that you already have Dig Testnet-2 installed and have a valid wallet. 

The dig folder will be overwritten with the new build; the important .dig folder will not be affected, but suggest backing up your old keys and private validator .json file anyway.

If you dont have keys created from a previous testnet, please do the following after step 4:

# 4.1. Create Validator keys
digd keys add validator
# Save the output including the mneumonic seed phrase in a safe place


You may not have GCC installed as this was not used in testnet-2, install as follows:

On Raspi/Archlinux
pacman -S gcc

On Ubuntu
apt-get install build-essential

```bash
# 1. clone dig source code
git clone https://github.com/notional-labs/dig
cd dig
#
# 2. install dig (note this can take up to 10 mins on a Raspi, doesn't always show progress, be patient)
go install ./...
# 3. name your node and write configuration to ~/.dig (remember to replace "moniker" with your public validator name)
digd init moniker --chain-id dig-testnet-3
#
#IF you get an error that genesis.json file already exists, use overwrite flag
digd init -o moniker --chain-id dig-testnet-3
# IF you get an error that 'digd not found' then your gopath is not setup properly.
# You can try:
# export GOPATH=~/go
# export PATH=$PATH:~/go/bin
#
# 4. put genesis.json in place
cp networks/testnet-3/genesis.json ~/.dig/config
#
# 5. check the name of your existing keys
digd keys list
# 6. Get Validator Public key and save in safe place
digd tendermint show-validator
#
# 7. Assign yourself a balance, replace "keyname" with the name of your keys from step 5
digd add-genesis-account keyname 100000000udig
#
# 8. define the amount you want to stake, replace "keyname" with the name of your keys from step 5
digd gentx keyname 100000udig --chain-id dig-testnet-3
# The above may say that filename.json already exists, simply delete this file by replacing the path and file name below:
rm filepath/filename.json
# Repeat Step 8 and you should now get an output like:
Genesis transaction written to "~/.dig/config/gentx/gentx-e4987c1bfc4c1135ddfd79ee0114e1212a747da3.json"
#
# 9. Copy the gentx file to your local dig repo, use the below command exactly as is
cp ~/.dig/config/gentx/* networks/testnet-3/
#
# 10. Submit a Pull Request with your gentx file
git add networks
# Replace "moniker" with your public validator name
git commit -m "gentx moniker"
# Create new branch, replace "moniker" with your validator name
git switch -c moniker
# Submit PR
gh pr create
# On message "Where should we push the 'moniker' branch?  [Use arrows to move, type to filter]"
# Select "notional-labs/dig" and press 'ENTER'
# Press 'ENTER' for Title and again body
# Select "Submit" and press 'ENTER'
```
## Note Well Please
* THIS IS A TESTNET, AND THE STATE OF GENESIS CAN/MAY/WILL CHANGE BEFORE MAINNET
  * For example, we've added 100m to ensure that consensus gets rolling and will take that out for mainnet.
* NEVER, EVER SHOW ANYONE YOUR SEED PHRASE
  * 
