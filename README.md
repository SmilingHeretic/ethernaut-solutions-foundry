# ethernaut-solutions-foundry

Solutions to smart contract security CTF [Ethernaut](https://ethernaut.openzeppelin.com/) written using [foundry](https://book.getfoundry.sh/)'s [Solidity scripting](https://book.getfoundry.sh/tutorials/solidity-scripting).

# How to run

1. [Install foundry](https://book.getfoundry.sh/getting-started/installation).
2. Create an app on [Alchemy](https://www.alchemy.com/) and set this app's network to Polygon Mumbai
3. Create `.env` file in the project directory and set the following variables in this file:
```
MUMBAI_RPC_URL=https://polygon-mumbai.g.alchemy.com/v2/<your Alchemy API key>
PRIVATE_KEY=<private key of the account that will be the player of Ethernaut>
```


### How to solve a level on a local fork of Mumbai network:
1. From the project directory run: `source .env`.
2. Start local fork of Mumbai with [anvil](https://book.getfoundry.sh/tutorials/forking-mainnet-with-cast-anvil):
```
anvil --fork-url $MUMBAI_RPC_URL
```
3. To solve e.g. level 25 run:
```
forge script script/SolveLevel25.s.sol:SolveLevel25 --rpc-url http://localhost:8545 --broadcast -vvvv
```

### How to solve a level on the actual Mumbai testnet:
1. From the project directory run: `source .env`
2. To solve e.g. level 24 run:
```
forge script script/SolveLevel24.s.sol:SolveLevel24 --rpc-url $MUMBAI_RPC_URL --broadcast -vvvv
```

### Known issues:
Solution of level 3 Coin Flip doesn't work on local anvil network. To solve it on the actual Mumbai network run:
```
forge script script/SolveLevel3.s.sol:SolveLevel3 --rpc-url $MUMBAI_RPC_URL --broadcast -vvvv --slow --skip-simulation
```
