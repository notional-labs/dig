# dig

[![Software Release](https://github.com/notional-labs/dig/actions/workflows/release.yml/badge.svg)](https://github.com/notional-labs/dig/actions/workflows/release.yml)
[![dig blockchain](https://github.com/notional-labs/dig/actions/workflows/build.yml/badge.svg)](https://github.com/notional-labs/dig/actions/workflows/build.yml)
[![Android](https://github.com/notional-labs/dig/actions/workflows/flutter.yml/badge.svg)](https://github.com/notional-labs/dig/actions/workflows/flutter.yml)
[![Genesis](https://github.com/notional-labs/dig/actions/workflows/main.yml/badge.svg)](https://github.com/notional-labs/dig/actions/workflows/main.yml)
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
Testnet two launched August 15-16.

We will need a testnet three becuase we'd like to use sign-mode EIP and that will require testing.  It will allow ethereum formatted addresses to be used natively on dig.



## Join Testnet

We are currently on testnet-2 and the master branch reflects that.  Work on testnet-3 is in the branch testnet-3.  Genesis state can be found on ipfs at:

Qme9pLVu3ZDzi5BTapqfHkuvacGT1FizQ3KVpuSyxzbmiN

Linux amd64:

```bash
wget https://github.com/faddat/dig/releases/download/latest/dig_latest_linux_amd64.tar.gz
tar xvf dig_latest_linux_amd64.tar.gz
mv digd /usr/bin
digd unsafe-reset-all
wget -O ~/.dig/config/genesis.json https://raw.githubusercontent.com/faddat/dig/master/networks/testnet-2/genesis.json
digd start --p2p.persistent_peers 1da97dd40866948f65b3aff3d8630b7d76ab20ea@95.217.196.54:2090
```

```bash
wget https://github.com/faddat/dig/releases/download/latest/dig_latest_linux_arm64.tar.gz
tar xvf dig_latest_linux_amd64.tar.gz
mv digd /usr/bin
digd unsafe-reset-all
wget -O ~/.dig/config/genesis.json https://raw.githubusercontent.com/faddat/dig/master/networks/testnet-2/genesis.json
digd start --p2p.persistent_peers 1da97dd40866948f65b3aff3d8630b7d76ab20ea@95.217.196.54:2090
```

Bounties, paid in dig, for further documentation.


## Dig is DIFFERENT

on a cosmos network, if you go offline while validating, you go to jail and are slashed 1% of delegated stake.

but it doesn't matter if you go offline, not really.  The key thing is to have 2/3rds of total delegated stake online continuously.

You won't be slashed for going offline on dig, but you will go to jail.  Later, dig will check itself like: am I a validator?  am I in jail?

and if dig is in jail it'll unjail itself.  This will involve the use of a less-secure wallet that is kept in the filesystem to be used for this purpose only.  Getting out of jail will be cheap.  

**double signing**

Signing the same block twice with the same key is even more heavily punished on Dig.  We think that you should keep your keys close to your chest.  I am typing this on my validator, by the way.  It's a MacBook.  



## ~~Genesis Transactions~~
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

## Design

**form**
* Software-wise, dig is a monorepo.  All of its essential code lives in this repository:
  * Genesis
  * Go App Code
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

We're comitted to transparency in all matters, including the composition of genesis allocations.  Dig has raised $0.  Adam has funded development work.  If we take funding, informaiton on that will go right here.  We will only accept funding from parties who are aligned with the long-term vision of the project and willing to have their tokens on exactly the same terms as those who get them in an airdrop.

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
- [ ] Clean airdrop code
  - [ ] Ionization
  - [ ] Test airdrop code for ethereum-style addresses using the Osmosis Cosmos SDK fork
  - [ ] Refactor airdrop if this works
- [ ] Community Security Audit: 0.1% of Dig tokens reserved for community members who provide a detailed, contextual audit
- [x] Block explorers
  - [x] gex
  - [x] big dipper
- [ ] Mainnet Launch
- [ ] IBC Integration via Notional and Chandra Station Relayers
- [ ] Osmosis Integration
- [ ] Emeris Integration
- [ ] Sif Integration
- [ ] Microtick Integration
- [ ] Announcement of candidate Real Estate development sites and their regulatory requirements
- [ ] DFY Integration
- [ ] Blurt Integration
- [ ] First update to dig mainnet
