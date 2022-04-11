# dig

[![dig blockchain](https://github.com/notional-labs/dig/actions/workflows/build.yml/badge.svg)](https://github.com/notional-labs/dig/actions/workflows/build.yml)
[![Raspberry Pi](https://github.com/notional-labs/dig/actions/workflows/pi.yml/badge.svg)](https://github.com/notional-labs/dig/actions/workflows/pi.yml)
[![Security Check](https://github.com/notional-labs/dig/actions/workflows/codeql-analysis.yml/badge.svg)](https://github.com/notional-labs/dig/actions/workflows/codeql-analysis.yml)

Dig is a hub blockchain that interconnects physical plots of land, which will each be governed by a locally operated blockchain.  Due to the regulatory challenges involved, dig splits itself up into many chains which can each follow appropriate legislation.  This is the beginning of the "Dig Network."


Here's a little light background reading:

* https://blurt.blog/blurt/@jacobgadikian/baby-blockchains
* https://blurt.blog/blurt/@jacobgadikian/blockchain-application-tco
* https://1729.com/miami/
* https://podclips.com/ct/gBhDsq
* https://twitter.com/gadikian/status/1424392074078523397


## Join Mainnet


```bash
git clone https://github.com/notional-labs/dig
cd dig
go install ./...
digd init yourcooldignamehere
wget -O ~/.dig/config/genesis.json https://github.com/notional-labs/dig/raw/master/networks/mainnets/dig-1/genesis.json
digd start --p2p.seeds 37b2839da4463b22a51b1fe20d97992164270eba@62.171.157.192:26656,e2c96b96d4c3a461fb246edac3b3cdbf47768838@65.21.202.37:6969 --p2p.persistent_peers 33f4788e1c6a378b929c66f31e8d253b9fd47c47@194.163.154.251:26656,64eccffdc60a206227032d3a021fbf9dfc686a17@194.163.156.84:26656,be7598b2d56fb42a27821259ad14aff24c40f3d2@172.16.152.118:26656,f446e37e47297ce9f8951957d17a2ae9a16db0b8@137.184.67.162:26656,ab2fa2789f481e2856a5d83a2c3028c5b215421d@144.91.117.49:26656,e9e89250b40b4512237c77bd04dc76c06a3f8560@185.214.135.205:26656,1539976f4ee196f172369e6f348d60a6e3ec9e93@159.69.147.189:26656,85316823bee88f7b05d0cfc671bee861c0237154@95.217.198.243:26656,eb55b70c9fd8fc0d5530d0662336377668aab3f9@185.194.219.128:26656 --db_backend rocksdb
```


[**Creating a validator**](https://github.com/notional-labs/dig/blob/master/dig_validator.md)

## Design
**form**
* Software-wise, dig is a monorepo.  All of its essential code lives in this repository:
  * Genesis
  * Javascript Front End Code
  * Mobile App
  * Block explorer

**function**
* The dig mainnet is as minimal as possible.  While we may add a few things before mainnet, it's our preference to remove things.  The dig mainnet is for coordinating the efforts of like-minded people who'd like to see:
  * Liquid Land: Blockchain style real estate investing
  * Charter Cities: Land where the rules are laid out on the chain that constitutes them
  * Hierarchical transparent governance: The trouble with hierarchical orgs is opacity, not hierarchy itself.
  * Research and development of blockchain governance in physical and virtual spaces.    


* Chains in the dig network will launch from the code in this repository, as well.   


## Financing
We're comitted to transparency in all matters, including the composition of genesis allocations.  Adam has raised funds for Dig's development work.  Pre-launch we'll post the final tally.  We will only accept funding from parties who are aligned with the long-term vision of the project. Investors in the project will have their coins unvested, while DFY airdrop participants will be vested over a 24 month period. 


## Confirmed-ish SoonTM Digs
These will launch rapidly after Dig.  Their paths will converge and diverge.  All of them will heavily leverage IBC, and some may leverage CosmWasm.


* Dig Vietnam
* Dig UK
* Dig Thailand
* Dig Laos
* Dig Marine



## Roadmap

- [x] Concept development by Jacob Gadikian and Adam Christopher Chaplin
- [x] Prototype
- [x] Airdrop Prototype code and OpenAPI spec
- [x] Testnet-1:  Results showed that we needed to work on the genesis parameters in Testnet-2
- [x] Omniflix Testnet-1: Participating in the OmniFlix testnet proved the viablity of a large validator set.  Testnet-2 allows 500 validators.
- [x] Upgrade to Cosmos SDK 0.43.0
- [x] IBC Testing
- [x] NFT Implementation by Khanh Nguyen (not included in testnet-2)
- [x] Genesis transactions for testnet-2: Completed August 14, 2021
- [x] Keplr integration
- [x] Akash-based Bus bar
- [x] Launch testnet-2
- [x] IPFS-based genesis hosting and download
- [x] Configuration overrides
- [x] Clean airdrop code https://github.com/notional-labs/c17 and https://github.com/notional-labs/staking-data-collection
  - [x] Test airdrop code for ethereum-style addresses using the Khanh's Cosmos SDK fork
  - [x] Refactor airdrop if this works
- [x] Community Security Audit: 0.1% of Dig tokens reserved for community members who provide a detailed, contextual audit (seems no one voluneered, and we've audited, but no one will be recieving this bounty. 
- [x] Block explorers
  - [x] gex
  - [x] big dipper 1.0
  - [x] ping.pub
  - [x] chill validation
  - [ ] mintscan: pending mintscan team availabity
- [x] Key Module Versions: This box is ticked if we're up to date
  - [x] ibc-go v3
    - [x] Interchain Accounts
  - [x] cosmos-sdk v0.45.2
  - [x] tendermint v0.34.16
  - [x] CosmWasm v0.25.0
- [x] Announcement of candidate Real Estate development sites and their regulatory requirements
  - [x] UK
  - [x] Ukraine
  - [x] Vietnam
  - [x] Thailand
  - [x] [Dig Marine](https://github.com/notional-labs/ccs)
- [x] Vesting for validators
- [x] Epoch y/n (yes)
  - [x] debug epoch
- [x] variable block time y/n (no)
- [x] Ionization 🧿: Fully Ionized
  - [x] 30m dig distributed to ion holders who've claimed their ion, whose ions have not been cast into the liquidity pool. 
- [x] 2nd genesis audit
- [x] Mainnet Launch
- [x] Chain Registry
- [x] IBC Integration
  - [x] Osmosis 
  - [x] Juno
  - [ ] Emeris 
  - [ ] Sif 
- [ ] Blurt Integration
- [x] First update to dig mainnet
