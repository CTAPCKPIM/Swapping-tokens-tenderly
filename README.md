# __Swapping tokens, using the tenderly__

__Smart contract__ for swapping _tokens_, and testing with help ___[Tenderly](https://tenderly.co/)___.
> Mainnet fork is used

### Functions of the smart contract:
+ `swapTokenAToB()` - the _function_ of swapping a __token A => B__; 
+ `swapTokenBToA()` - the _function_ of swapping a __token B => A__;

 > New functions are coming soon..

## __Tokens:__ (_for testing_)
- [__WETH__](https://etherscan.io/address/0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2);
- [__USDC__](https://etherscan.io/address/0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);
- __LP:__ [__WETH + USDC__](https://etherscan.io/address/0xB4e16d0168e52d35CaCD2c6185b44281Ec28C9Dc);

# __Hardhat Project__

In this project using __"Yarn"__.

+ `yarn build` - for compile contracts;
+ `yarn test` - for testing contracts;
+ `yarn coverage` - for see coverage;
+ `yarn size` - for see the size of all contracts;
+ `yarn prettier` - for code formatting;
