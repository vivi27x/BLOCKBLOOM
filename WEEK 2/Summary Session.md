* Create a Metamask account. Switch to Sepolia test network.  
* Get ETH from Sepolia faucet (**Collect everyday**)  
* Explore OpenSea and understand NFTs  
* Create a collection and NFT(s) in that collection using the OpenSea Create option  
  Note that OpenSea has automatically created the required smart contracts for you and has executed them to mint NFTs.

Creating your own Smart Contract:

* Use OpenZeppelin Contract Wizard to get the ERC-721 contract (ERC-721 is the token standard for NFTs). Choose Mintable, Auto Increment Ids and URI Storage.  
* Copy the smart contract code to Remix.  
* Compile  
* Deploy (with yourself as the owner)  
* Explore Sepolia Etherscan and understand how the transaction (deployment) works.  
* To mint an NFT, we need URI to the metadata (information about the NFT). 

Creating the metadata file on a distributed file system:

* Open Pinata and upload the image in the IPFS Files section.    
* Create a file called metadata.json. The file should look something like [this](https://drive.google.com/file/d/1AI1GM_3Yx1aXUfRSlPIqxNEhGSQjrKew/view?usp=sharing).  
* Note that this metadata.json file includes the URI of the image.  
* Upload metadata.json to Pinata. Copy the URI of the metadata.json file and pass it as a parameter to the safeMint function in Remix. Keep ‘to’ address as the address who you want to make as the owner of the NFT. (See that you can keep the owner of an NFT different from the owner of the smart contract minting that NFT).  
* Mint the NFT.  
* Explore Sepolia Etherscan and understand how the transaction (minting an NFT, calling a function (in simple terms)) works.  
* You can view your minted NFT on OpenSea using the following format:  
    
  https://testnets.opensea.io/assets/sepolia/CONTRACT\_ADDR/NFT\_NUM  
    
  Put your CONTRACT\_ADDR and NFT\_NUM appropriately.  
  NFT\_NUM is 0 for your first minted NFT and increases by 1 for further minted NFTs.  
    
  
