# BLOCKBLOOM
Repository for Project Blockbloom, an introductory Web3 project under Google Developer Group, IIT KANPUR. It encompasses the 4 weeks long learning journey and includes Intro to Blockchain, Intro to Tokens and NFTs, Intro to Smart Contracts, Intro to Soldity and REMIX. Building DApps. 

## Week 1: **Understanding Blockchain Basics**

* **Evolution of the Web**  
  Gain an understanding of how the internet evolved from static Web 1.0 to dynamic Web 2.0, and its transition toward decentralized Web 3.0. What problems does Web 3.0 aim to solve? How does blockchain technology fit into this? **([Link](https://www.geeksforgeeks.org/web-1-0-web-2-0-and-web-3-0-with-their-difference/))**  
* **"But how does Bitcoin actually work?"**  
  Watch this [video](https://www.youtube.com/watch?v=bBC-nXj3Ng4) to get a beginner-friendly introduction to the technical underpinnings of Bitcoin and blockchain. Concepts covered include transactions, blocks, and distributed ledgers.  
* **Cryptographic Hash Function ([Link](https://en.wikipedia.org/wiki/Cryptographic_hash_function))**  
  Understand what cryptographic hash functions are and their importance in securing data. Study characteristics such as determinism, collision resistance, and pre-image resistance.  
  Learn about [SHA256](https://medium.com/@munteanu210/a-non-technical-guide-to-sha-256-algorithm-2ae70df09fb#:~:text=have%20size%20restrictions.-,Is%20SHA%2D256%20Secure?,values%20to%20verify%20data%20integrity.), the cryptographic hash function widely used in blockchain. Explore its role in generating unique digital signatures for data blocks.

* **What is a Blockchain?([Link](https://www.investopedia.com/terms/b/blockchain.asp))**  
  Understand the core structure of blockchain: blocks, chains, and nodes. Key questions to consider: How do blockchains achieve immutability? Why is decentralization important?  
  Study the mechanism behind [PoW](https://www.investopedia.com/terms/p/proof-work.asp) and its role in ensuring consensus in blockchain networks. Key aspects to learn: mining, computational puzzles, and energy consumption. Explore [PoS](https://www.investopedia.com/terms/p/proof-stake-pos.asp) as an alternative consensus mechanism. Learn about staking, validators, and how PoS addresses some limitations of PoW. Engage with this interactive [demo](https://andersbrownworth.com/blockchain/) tool to visualize how Proof of Work operates.   
* **51% Attack**  
  Understand what a [51% attack](https://www.investopedia.com/terms/1/51-attack.asp) is and why it poses a significant risk to blockchain networks. Study scenarios where this attack becomes feasible and measures to prevent it.  
* **Bitcoin whitepaper**  
  Read and analyze the original [Bitcoin whitepaper](https://bitcoin.org/bitcoin.pdf) by Satoshi Nakamoto.                Key focus: Peer-to-peer transactions, cryptographic proof, and decentralized trust.  
* (Optional) [Zero knowledge proofs](https://www.youtube.com/watch?v=_MYpZQVZdiM)

* **Assignment 1**
Additional Programming Question : 
* Write a program in any programming language that simulates the cryptographic problem solved in PoW. (Find the smallest nonce (a whole number) such that SHA-256 hash of the new string is less than the threshold.). Input by user: String , Output: Nonce, Time taken to find the nonce. You can assume a threshold like 0x000FF…..F (that is the first 3 hexadecimal digits should be 0 for the nonce to be accepted). Also assume that the nonce has to be appended at the end of the given string.

## Week 2: **Introduction to Ethereum**

#### **Ethereum Basics:**

**Topics:**

1. **Overview of [Ethereum (Whitepaper)](https://ethereum.org/en/whitepaper/):** Detailed study of Ethereum's whitepaper and key concepts, highlighting how it differs from Bitcoin in terms of purpose and functionality.  
2. **Use Cases of Ethereum:** Exploration of Ethereum's applications beyond cryptocurrency, including smart contracts, decentralized applications (dApps), and DeFi.

#### **Getting Hands Dirty:**

**Activities:**

1. [**Session Summary**] : A recap of the practical demonstration conducted during the session, covering key steps and outcomes. 
By follwing the steps of this session, you will:
* Set up Metamask and switch to the Sepolia test network.
* Obtain test ETH from the Sepolia faucet.
* Explore OpenSea, create an NFT collection, and understand prebuilt smart contracts.
* Use OpenZeppelin Contract Wizard to generate an ERC-721 NFT smart contract.
* Deploy the contract using Remix and verify transactions on Sepolia Etherscan.
* Upload NFT images and metadata.json to Pinata (IPFS) for decentralized storage.
* Mint an NFT using the safeMint function and set ownership.
* View and share minted NFTs on OpenSea Testnet.
This session provides hands-on experience in NFT creation, smart contract deployment, and blockchain transactions.
2. **Required Tools Usage:**  
   * [**Metamask Installation**](https://www.youtube.com/watch?v=kHF70SWFTYU)**:** Step-by-step guide to setting up the Metamask browser extension for interacting with Ethereum.  
   * [**Sepolia Faucet**](https://cloud.google.com/application/web3/faucet/ethereum/sepolia)**:** Learn to obtain test Ether for Sepolia, a test network.  
   * [**OpenZeppelin Contract Wizard**](https://wizard.openzeppelin.com/)**:** Utilize OpenZeppelin's tool to generate secure smart contract templates.  
   * [**Remix IDE**](https://remix.ethereum.org/)**:** Hands-on practice with Remix, an online IDE for developing and deploying smart contracts.  
   * [**Pinata**](https://pinata.cloud/)**:** Understanding how to use Pinata for IPFS-based file storage and NFT metadata hosting.  
   * [**OpenSea Testnets**](https://testnets.opensea.io/)**:** Explore OpenSea's testnets for NFT creation, minting, and listing.  
   * [**Sepolia Etherscan**](https://sepolia.etherscan.io/)**:** Familiarize yourself with Sepolia's blockchain explorer to monitor transactions and deployed contracts.

3. **Assignment 2**
Additional Programming Questions : 
* Write a program to generate an Ethereum address. (You can use any library in any language) Note: There is no input to your program.
* Write a program to demonstrate the contract address generation.(You can use any library in any language) Note: Sender’s address and nonce are the input for your program.Submit your code with some hard coded inputs.
* Create a program to demonstrate transaction signing and verification in Ethereum.(You can use any library in any language) Note: Input to your signing function are a transaction (an object having fields like receiver's address, ether to be sent, sender’s nonce, gas price, etc..) and a private key of the sender and this function should return a signed transaction. Input to your verification function are the signed transaction and sender’s address.

## Week 3: **Solidity**

1. Solidity [documentation](https://docs.soliditylang.org/en/v0.8.28/) : A deep dive into the official Solidity documentation to understand the syntax, features, and best practices for writing smart contracts.

2. Example Codes : Review and explanation of the Solidity code examples discussed during the session, including their purpose and functionality.

3. Assignment 3
