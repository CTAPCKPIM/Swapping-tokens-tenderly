import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import * as tdly from "@tenderly/hardhat-tenderly";
require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("dotenv").config();
require('hardhat-contract-sizer');
tdly.setup(); 

// Importing keys from '.env'
const KEY = process.env.SECRET_KEY;
const INFURA = process.env.PROVIDER_INFURA;
const ETHERSCAN = process.env.ETHERSCAN_KEY;
// Tenderly keys from '.env'
const NAME = process.env.USERNAME;
const PROJECT = process.env.PROJECT_NAME;
const FORK = process.env.TENDERLY_FORK_URL;
const ID = process.env.FORK_ID;

module.exports = { 
  solidity: "0.8.17",

  networks: {
    goerli: {
      url: INFURA,
      accounts: [KEY],
    },
    tenderly: {
      url: FORK,
      chainId: 1,
    },
  },
  etherscan: {
    apiKey: {
      goerli: ETHERSCAN, 
    },
  },
  tenderly: {
      project: PROJECT,
      username: NAME,
      forkNetwork: ID,
    },
};

