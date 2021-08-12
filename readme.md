# dig

Dig is a hub blockchain that interconnects physical plots of land, which will each be governed by a locally operated blockchain.  Due to the regulatory challenges involved, dig splits itself up into many chains which can each follow appropriate legislation.  This is the beginning of the "Dig Network."


Here's a little light background reading:

* https://blurt.blog/blurt/@jacobgadikian/baby-blockchains
* https://blurt.blog/blurt/@jacobgadikian/blockchain-application-tco
* https://1729.com/miami/
* https://podclips.com/ct/gBhDsq
* https://twitter.com/gadikian/status/1424392074078523397

## Get started
We are accepting genesis transactions until we say that we're no longer accepting genesis transactions :).  Here are some generic linux instructions for doing those.  They assume that you have the github cli installed.

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


