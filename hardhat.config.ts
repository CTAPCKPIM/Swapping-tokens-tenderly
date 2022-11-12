import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("dotenv").config();
require('hardhat-contract-sizer');

//Importing keys from '.env'
const KEY = process.env.SECRET_KEY;
const INFURA = process.env.PROVIDER_INFURA;
const ETHERSCAN = process.env.ETHERSCAN_KEY;

const config: HardhatUserConfig = {
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
  }
}
export default config;
