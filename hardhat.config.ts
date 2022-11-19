import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import * as tdly from "@tenderly/hardhat-tenderly";
require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("dotenv").config();
require('hardhat-contract-sizer');
tdly.setup();

//Importing keys from '.env'
const KEY = process.env.SECRET_KEY;
const INFURA = process.env.PROVIDER_INFURA;
const ETHERSCAN = process.env.ETHERSCAN_KEY;
//Tenderly keys
const name = process.env.USERNAME;
const project_name = process.env.PROJECT_NAME;

module.exports = { 
  solidity: "0.8.17",

  networks: {
    goerli: {
      url: INFURA,
      accounts: [KEY],
    },
  },
  etherscan: {
    apiKey: {
      goerli: ETHERSCAN, 
    },
  },
  tenderly: {
      project: project_name,
      username: name,
    },
}
//export default config;
