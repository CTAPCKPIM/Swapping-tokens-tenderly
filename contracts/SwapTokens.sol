// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

import './interfaces/IUniswapV2Factory.sol'; 
import './interfaces/IUniswapV2Router02.sol';
import './interfaces/IUniswapV2Pair.sol';
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/**
 * @author by CTAPCKPIM
 * @title Smart contract for token exchange 
 * @notice This smart contract uses pancakeswap to exchange tokens
 */
contract SwaprTokens {
    /**
     * {uinswapFactory} - address of the 'UniswapV2Factory';
     * {uinswapRouter} - address of the 'UniswapV2Router02';
     * {uinswapPair} - address of the 'UniswapV2Pair';
     */
    address public uinswapFactory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address public uinswapRouter = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address public uinswapPair = 0x3356c9A8f40F8E9C1d192A4347A76D18243fABC5;

    /**
     * Function to receive the amount after a token swap
     *  {pairAddress} - address of the liquid pair;
     *  {reserve0} - reserve of the tokenA;
     *  {reserve1} - reserve of the tokenB;
     *  {amount} - amount after swap tokenA => tokenB;
     * @return amount of the token
     */
    function getPriceOnToken(uint256 _yourTokens, address _token0, address _token1) public view returns(uint256) {
        address pairAddress = IUniswapV2Factory(uinswapFactory).getPair(_token0, _token1);
        (uint256 reserve0, uint256 reserve1, ) = IUniswapV2Pair(pairAddress).getReserves();
        uint256 amount = IUniswapV2Router02(uinswapRouter).quote(_yourTokens, reserve0, reserve1);
        return amount;
    }

}