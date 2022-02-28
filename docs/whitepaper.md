# Dig Chain (DRAFT for collaboration purposes)

Dig Chain is a governance-focused layer-1 blockchain that acts as a hub for numerous regional Dig chains, each designed to facilitate the tokenization of real estate. Dig Chain will also enable CW20 smart contracts. Dig Chain was built using Cosmos SDK, Tendermint SDK, and Starport.

The reason various regional blockchains are necessary is simple: regulations surrounding real estate are different in different jurisdictions. Each blockchain will be geo-fenced to a particular jurisdiction to ensure it can be compliant with local regulations.

They will all connect seamlessly to the hub Dig Chain via IBC (inter-blockchain communication).

## What is IBC?
Understanding IBC is crucial to understanding how Dig Chain works. IBC is like a collection of cogs - each cog being a completely independent blockchain - all interconnecting with each other. The best place to visualize IBC is mapofzones.com.

It is very important to understand that IBC is not a bridge between chains like an Ethereum-BSC bridge. In a bridge, tokens are locked and then a new token is created on the separate chain, representing the locked token. This is not the case with IBC. With IBC, tokens can be transacted freely between blockchains.

This was first limited to blockchains built using Cosmos SDK and Tendermint SDK, but this has now expanded to include Terra (LUNA), and is due to bring Ethereum into the Cosmos Network as well.  
In short, IBC - inter-blockchain communication - creates a web of connected, sovereign blockchains that can utilize DeFi protocols together, work smart contracts together, and transfer assets seamlessly together.

This is the foundation of Dig Chain.

## The Regional Model of Dig Chain
Now that you understand how IBC works, I want you to visualize Dig Chain with multiple regional chains connected to it, like Dig UK, Dig Florida, Dig Cayman Islands, Dig Ukraine, Dig Thailand, and so on.

Each of these regional chains will share the same fundamental design as Dig Chain but will be programmed to comply with the regulatory regime in the jurisdiction in which they operate. This is a very important point to note as real estate laws in the United Kingdom are very different from those in, say, Vietnam, Russia, Texas, or Italy. It is our opinion that previous attempts of real estate tokenization have failed because they failed to address crucial regulatory and scalability issues.
 
·  	In the United States, for example, regulations vary at the State level - and at times at the County/local municipality level. An ERC20 token that tries to address this will inevitably fail.
·  	Dig Chain utilizes permissions, decentralized exchanges as windows for governance of Dig’s regional chains instantiated by Dig Chain itself.
·  	Dig Chain creates a model for localized, compliant, governance-enabled layer-1 blockchains to manage tokenized real estate at ground level.
·  	We envision there being hundreds of forked regional chains IBC connected to Dig Chain in the coming years. Why? Because people want to be able to buy real estate with crypto.
·  	These regional chains could operate at a national level, or even as local as a self-sustaining DAO commune that organizes itself through chain governance.
·  	We envision that the regional chains would not have their own token, but rather would use NFTs to represent legally-binding contracts of ownership for properties or shares of properties.
·  	How this is achieved depends on the jurisdiction in which the chain is operating. For example, some countries/states will likely require a company to be incorporated that represents ownership of a property, and then shares issued to represent ownership of that property, with the NFTs representing the shares.
 
## Experiment with Dig Chain
Dig Chain is 100% open source, with all the code viewable at www.GitHub.com/notional-labs/dig. Anyone who wants to create a regional Dig Chain of their own is free to do so, so long as they adhere to following the laws of the land in the region they operate it in.

We invite and actively encourage experimentation. We will support you where we can. You are free to submit a signaling proposal on the Dig Chain governance module to request support from the community pool.

## CosmWasm Smart Contracts
Dig Chain V2.0 will support CW20 smart contracts. CosmWasm was designed by Ethan Frey and provides an advanced smart contract model for the Cosmos Network.

CW20 contracts are designed to plug security holes in ERC20 contracts, such as Reentrancy, Arithmetic under/overflows, Default Visibilities, and more, which have led to several high-profile breaches.

By enabling CW20 contracts on Dig Chain V2.0, anyone can deploy a smart contract on Dig Chain (just like you can create a token smart contract on Ethereum).  

We do not know exactly what people will create - and that’s the exciting part. Dig Chain itself could even facilitate CW20 smart contract tokens that are designed to tokenize localized real estate, or DeFi protocols, or GameFi ventures.
By enabling CosmWasm, Dig Chain gains more value and can become a hub for innovation as well as for real estate tokenization. We allow people to experiment and build on Dig without exposing the chain to additional risk.

## Dig Chain Economic Model
Dig Chain, and the DIG token, was intentionally launched in the Cosmos Network’s emerging DEX ecosystem.

Cosmos DEXs like Osmosis and JunoSwap have a superior model for providing liquidity by utilizing inflationary incentives. Unlike Uniswap and PancakeSwap, and other token-based DEXs, Cosmos has the advantage of being full of inflationary layer-1 blockchains, meaning incentives can be managed over the long-haul.

Liquidity provision is strong and creates price support, while staking incentives can be managed via community governance to ensure that staking incentives are increased when the overall bonding ratio is low, and decreased when a 67% target bonded threshold is met.

This helps to secure the chain by keeping large flows of DIG off the market, and by providing additional incentives to validators who manage the upkeep and security of the chain itself.

DIG was originally launched with a supply of 947 million, with inflation of 20% per year. Note that the inflation rate is subject to change via governance proposals to ensure that a 67% bonded target is reached to secure the network.
There were three airdrops for DIG:
1.	DFY token holders: DeFi For You is a project on Binance Smart Chain launched by Adam Chaplin, one of the founders of Dig Chain. DFY holders received 1-to-1 DIG for each DFY token they held, and 1.5-to-1 for each DFY token they had locked up.
2.	Blurt coin holders: The Blurt blockchain was a fork of Steemit that removed a feature whereby user’s content could never be removed from the site. The chain was developed by Jacob Gadakian and Ricardo Ferrier, among others, who are two key members of the Dig Chain team.
3.	ION coin holders: The ION coin was created by the founders of the Osmosis blockchain and acts as a governance coin for the Osmosis DEX.

Notional Labs, the development DAO that built Dig Chain, received a 5% stake, which they have fully delegated to validators on Dig Chain. Notional Labs itself validates more than 20 Cosmos chains and actively participates in governance on all the chains it validates. It also operates one of the Cosmos Networks leading relaying systems, and contributes code to a number of chains, including Cosmos Hub, Osmosis, Juno, Craft Economy, Ixo, Sif, Terra, and others.

Notional Labs does not validate Dig Chain, as it sees this as being a potential conflict of interest, given that it built the chain.

Dig Chain has a maximum 69 validators, who collectively received a 2.5% stake of the DIG supply. This is vested and was self-delegated to kick-start the chain.

A total 130 million DIG was sold in a pre-sale to fund the development of the chain, staffing subsidies, and the development of regional chains in the future.

A total of 47 million - accounting for 5% of the initial supply - of DIG was reserved for liquidity provision. This has been used on the Osmosis DEX in the DIG/OSMO pool (621), and in JunoSwap in the DIG/JUNO pool.

The point of liquidity provision is to provide price support for DIG. Some of this was also used to provide incentives to people who bond DIG in liquidity pools on Osmosis DEX. These incentives have since been matched by OSMO incentives after a successful governance proposal via Osmosis.

The founders of Dig Chain hold a total 80 million DIG, all of which is delegated to validators, or in liquidity pools on Osmosis DEX and JunoSwap.

## Community Pool
A total 5% of DIG inflation automatically goes to the Community Pool. Anyone can submit a governance proposal requesting funds from the pool be allocated to a specific task. They can fix a wallet address in the proposal. The community then votes on whether they think these funds should be allocated or not.

A classic use-case of community pool funds would be to fund a marketing DAO, or other chain support ventures.

## Dig Chain’s Consensus Algorithm

Dig Chain is a proof-of-stake (POS) blockchain that is maintained by a group of validators. Holders of DIG coins can delegate them to a validator to receive a share of the chain’s inflation.

Validators are incentivized to keep the chain secure and healthy thanks to the commissions they receive in DIG from users delegating to them. This is why proof-of-stake chains are inflationary - they must mint new coins in order to pay rewards, in order to incentivize validators, in order to keep the chain alive.
Dig Chain’s Governance

Governance is a key feature of Dig Chain. In fact, Dig Chain was intentionally designed to have very few features. This is because simple things work better. Bitcoin mastered this by doing very, very little. Many chains since have over-complicated things - and smart contracts have taken this leagues further.

Dig Chain V1.0 was simple, and V2.0 has stripped back even more features, while adding support for CW20 smart contracts, so the fun experimental stuff can take place there, while mitigating risk to the chain itself.
The main feature of Dig Chain is governance.

Anyone who has delegated DIG to a validator can vote on governance proposals through the Dig dApp, or through third-parties like www.ping.pub/dig/gov.

Governance proposals can be created on Commonwealth. Currently, a deposit of 10,000 DIG is required for a proposal.

If a proposal passes, the users who committed to the deposit get their funds back, but if the proposal is vetoed, those funds go to the Community Pool instead.

The voting period once a proposal passes the deposit stage is currently 48 hours, although this can be changed via a governance proposal. Many things about Dig Chain can be changed via governance, such as inflation, and so on.

## A Model for Tokenizing Real Estate
Each regional chain for Dig Chain will behave differently. Each one will be programmed differently. The real leg work of Dig comes in having a thorough understanding of the regulatory regime in a given jurisdiction in which a chain will be established.

It is essential to have legal support throughout this process, and it is essential to have ‘boots on the ground’.

Dig is not a finished product. No matter how much property is tokenized in how many regions, it will never be truly finished, because there will always be something more to do with it.

Currently, the core team and founders of Dig Chain are actively pursuing the following geo-fenced regional chains:
·  	Dig United Kingdom
·  	Dig Vietnam
·  	Dig Florida
·  	Dig Cayman Islands
·  	Dig Thailand 
·  	Dig Ukraine
·  	Dig Laos

We have team members in all of these jurisdictions, and one of these will be the first regional chain launched, with the first Dig property tokenized on it. This will require a new chain to be developed to program in the regulations of that particular nation or state. Time and care must be spent to get this right.

## Dig Chain is Global

If you believe you could contribute to a regional chain for Dig, then we would welcome you getting in touch. Together we can discuss your idea and work towards implementing it.

