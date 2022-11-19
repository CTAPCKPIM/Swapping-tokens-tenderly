import { time, loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("SwapTokens:", function () {
  let addressOne: any;
  let addressTwo: any;
  let swapTokens: any;

  before(async () => {
    //Getting an address for the tests;
    [addressOne, addressTwo] = await ethers.getSigners();

    //Deploy the 'SwapTokens.sol';
    const SwapTokens = await ethers.getContractFactory("SwapTokens");
    swapTokens = await SwapTokens.deploy();
    await swapTokens.deployed();
  });

  // Deploys the contract;
  it("Should be: deployed", async () => {
    await expect(swapTokens.address).to.be.properAddress;
  });
});

