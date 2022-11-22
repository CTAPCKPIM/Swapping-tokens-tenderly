import { time, loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("SwapTokens:", function () {
  let addressOne: any;
  let addressTwo: any;
  let swapTokens: any;
  let amount = 1000;

  before(async () => {
    // Getting an address for the tests;
    [addressOne, addressTwo] = await ethers.getSigners();

    // Deploy the 'SwapTokens.sol';
    const SwapTokens = await ethers.getContractFactory("SwapTokens");
    swapTokens = await SwapTokens.deploy();
    await swapTokens.deployed();
  });

  // Checking in deploying of smart contract;
  it("Should be: deployed", async () => {
    await expect(swapTokens.address).to.be.properAddress;
  });

  // Checking in swap WETH to USDC; Error: cannot estimate gas; transaction may fail or may require manual gas 
  it.only("Should be: swap WETH => USDC", async () => {
    await swapTokens.connect(addressOne).swapTokenAToB(amount)
    /*await expect(swapTokens.connect(addressOne).swapTokenAToB(amount))
    .to.emit(swapTokens, "Swapped")
    .withArgs(anyValue, addressOne)*/
  });
});

