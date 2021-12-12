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


## Status
SoonTM


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
- [x] Upgrade to ibc-go v2
- [x] Upgrade to cosmos-sdk v0.44.5
- [x] Upgrade to tendermint v0.34.15
- [x] Announcement of candidate Real Estate development sites and their regulatory requirements
  - [x] UK
  - [x] Ukraine
  - [x] Vietnam
  - [x] Thailand
  - [x] [Dig Marine](https://github.com/notional-labs/ccs)
- [ ] Vesting for validators
- [x] Epoch y/n (yes)
- [x] variable block time y/n (no)
- [x] Ionization  🧿: Underway 
- [ ] Mainnet Launch
- [ ] IBC Integration
  - [ ] Osmosis 
  - [ ] Emeris 
  - [ ] Sif 
- [ ] DFY Integration
- [ ] Blurt Integration
- [ ] First update to dig mainnet
