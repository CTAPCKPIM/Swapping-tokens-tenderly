/*import { time, loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";

var SwapTokens = artifacts.require(".contracts/SwapTokens.sol");

contract('SwapTokens', function (accounts) {
  let addressOne: any;
  let addressTwo: any;
  beforeEach(async () => {
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
});*/
