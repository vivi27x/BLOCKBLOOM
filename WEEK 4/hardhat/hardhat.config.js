require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

const {API_URL, PRIVATE_KEY} = process.env;

module.exports = {
  solidity: "0.8.28",
  networks: {
    sepolia: {
      url : API_URL,
      accounts: [PRIVATE_KEY]
    }
  }
};
