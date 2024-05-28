Overview
The MyToken contract is a basic Ethereum ERC20 token implementation written in Solidity. It allows for the creation, minting, and burning of tokens on the Ethereum blockchain.

Features
Token Details:

name: The name of the token.
symbol: The symbol or abbreviation of the token.
totalSupply: The total number of tokens that exist.
Mapping:

balances: A mapping of Ethereum addresses to their respective token balances.
Functions:

constructor: Initializes the token with a name, symbol, and initial total supply.
mint: Creates new tokens and assigns them to a specified address.
burn: Destroys tokens by subtracting them from a specified address.
Getting Started
Prerequisites
Node.js and npm (Node Package Manager)
Solidity Compiler
Truffle
Installation
Clone the repository:

bash
Copy code
git clone https://github.comhorlciks31/my-token-contract.git
cd my-token-contract
Install dependencies:

bash
Copy code
npm install
Usage
Compile the smart contract:

bash
Copy code
truffle compile
Deploy the smart contract:

bash
Copy code
truffle migrate --network development
Example
javascript
Copy code
const Web3 = require('web3');
const HDWalletProvider = require('@truffle/hdwallet-provider');

const mnemonic = "your twelve word mnemonic"; // Insert your mnemonic
const infuraUrl = "https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID"; // Replace with your Infura project ID
const provider = new HDWalletProvider(mnemonic, infuraUrl);

const web3 = new Web3(provider);

const contractABI = [ /* ABI of MyToken contract */ ];
const contractAddress = "0x123..."; // Replace with the deployed contract address

const myTokenContract = new web3.eth.Contract(contractABI, contractAddress);

async function main() {
    const accounts = await web3.eth.getAccounts();

    // Mint 500 tokens to address accounts[0]
    await myTokenContract.methods.mint(accounts[0], 500).send({ from: accounts[0], gas: 500000 });

    // Burn 200 tokens from address accounts[0]
    await myTokenContract.methods.burn(accounts[0], 200).send({ from: accounts[0], gas: 500000 });

    // Check balances after transactions
    const balanceOfAccount0 = await myTokenContract.methods.balances(accounts[0]).call();
    console.log(`Balance of accounts[0]: ${balanceOfAccount0}`);
}

main();
License
This project is licensed under the MIT License. See the LICENSE.txt file for details.

