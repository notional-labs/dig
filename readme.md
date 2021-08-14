# dig

Dig is a hub blockchain that interconnects physical plots of land, which will each be governed by a locally operated blockchain.  Due to the regulatory challenges involved, dig splits itself up into many chains which can each follow appropriate legislation.  This is the beginning of the "Dig Network."


Here's a little light background reading:

* https://blurt.blog/blurt/@jacobgadikian/baby-blockchains
* https://blurt.blog/blurt/@jacobgadikian/blockchain-application-tco
* https://1729.com/miami/
* https://podclips.com/ct/gBhDsq
* https://twitter.com/gadikian/status/1424392074078523397



## Get started
**Genesis Transactions for Testnet-2 are now closed.  If Testnet-2 functions as desired, there will be no Testnet-3**

If you are using ubuntu, please do not use its native golang package, it is two years old.  Instead:

```bash
wget -q -O - https://git.io/vQhTU | bash -s -- --version 1.16.7
```

```bash
cd ~/
git clone https://github.com/faddat/dig
cd dig
go mod tidy
cd cmd/digd
go install .
cd ~/
digd init yourname
cp dig/networks/testnet-2/genesis.json ~/.dig/config
# DEAR GOD KEEP YOUR SEED PHRASE.
digd keys add validator
digd add-genesis-account validator 1000000000udig
digd gentx validator 100000000udig --chain-id dig-testnet-2
cp ~/.dig/config/gentx/* ~/dig/networks/testnet-2/gentx
cd dig
git add networks
git commit -m "gentx yourvalidatormoniker"
gh auth login
gh pr create
```

## Roadmap

- [x] Concept development by Jacob Gadikian and Adam Christopher Chaplin
- [x] Prototype
- [x] Airdrop Prototype code and OpenAPI spec
- [x] Testnet-1:  Results showed that we needed to work on the genesis parameters in Testnet-2
- [x] Omniflix Testnet-1: Participating in the OmniFlix testnet proved the viablity of a large validator set.  Testnet-2 allows 250 validators.
- [x] Upgrade to Cosmos SDK 0.43.0
- [x] IBC Testing
- [x] NFT Implementation by Khanh Nguyen (not included in testnet-2)
- [x] Genesis transactions for testnet-2: Completed August 14, 2021
- [x] Keplr integration
- [ ] Akash-based Bus bar
- [ ] Launch testnet-2
- [ ] Clean airdrop code
  - [ ] Ionization
  - [ ] Test airdrop code for ethereum-style addresses using the Osmosis Cosmos SDK fork
  - [ ] Refactor airdrop if this works
- [ ] Community Security Audit: 0.1% of Dig tokens reserved for community members who provide a detailed, contextual audit
- [ ] Block explorer
- [ ] Mainnet Launch
- [ ] Osmosis Integration
- [ ] Emeris Integration
- [ ] Sif Integration
- [ ] Microtick Integration
- [ ] Announcement of candidate Real Estate development sites and their regulatory requirements
- [ ] DFY Integration
- [ ] Blurt Integration
- [ ] First update to dig mainnet
