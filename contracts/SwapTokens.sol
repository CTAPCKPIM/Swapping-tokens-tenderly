// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

import './interfaces/IUniswapV2Factory.sol'; 
import './interfaces/IUniswapV2Router02.sol';
import './interfaces/IUniswapV2Pair.sol';
import '@openzeppelin/contracts/token/ERC20/IERC20.sol';

/**
 * @author by CTAPCKPIM
 * @title Smart contract for token exchange 
 * @notice This smart contract uses pancakeswap to exchange tokens
 */
contract SwapTokens {
    // Show the amount and sender
    event Swapped(uint amount, address user);

    /**
     * {uinswapFactory} - address of the 'UniswapV2Factory';
     * {uinswapRouter} - address of the 'UniswapV2Router02';
     * {uinswapPair} - address of the 'UniswapV2Pair';
     * {WETH} - address of the 'WETH' token;
     * {USDC} - address of the 'USDC' token;
     */
    address public uinswapFactory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address public uinswapRouter = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address public uinswapPair = 0x3356c9A8f40F8E9C1d192A4347A76D18243fABC5;
    address public WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address public USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

    /**
     * Interfaces of the 'Uniswap' and 'ERC20'
     */
    IUniswapV2Factory private factory = IUniswapV2Factory(uinswapFactory);
    IUniswapV2Router02 private router = IUniswapV2Router02(uinswapRouter);
    IUniswapV2Pair private pair = IUniswapV2Pair(uinswapPair);
    IERC20 private weth = IERC20(WETH);
    IERC20 private usdc = IERC20(USDC);

    /**
     * Swap WETH to USDC
     *  {path} - array with addresses of tokens;
     *  {amauntOutMin} - amount of the token;
     *  {balance} - balance of the user;
     *  {amounts} - array with data from the function;
     * @return {amounts[1]}
     */
    function swapTokenAToB(uint256 _amountIn) public returns(uint256) {
        address[] memory path = new address[](2);
        path[0] = WETH;
        path[1] = USDC;
        // Need to approve the token
        weth.transferFrom(msg.sender, address(this), _amountIn); //HERE!!
        uint256[] memory amauntOutMin = router.getAmountsOut(_amountIn, path);
        weth.approve(address(router), amauntOutMin[1]);
        uint256 balance = usdc.balanceOf(msg.sender);
        // User gives WETH(18 decimal) and get USDC(6 decimal)   
        uint256[] memory amounts = router.swapExactTokensForTokens(
            _amountIn,
            amauntOutMin[1], 
            path,
            msg.sender,
            block.timestamp
        );
        // The balance must be changed minimum on {amauntOutMin[1]}
        require(usdc.balanceOf(msg.sender) >= balance + amauntOutMin[1], 'Balance not changed');
        emit Swapped(amounts[1], msg.sender);
        // Amounts[1] = USDC amount
        return amounts[1];
    }

    /**
     * Swap USDC to WETH
     *  {path} - array with addresses of tokens;
     *  {amauntOutMin} - amount of the token;
     *  {balance} - balance of the user;
     *  {amounts} - array with data from the function;
     * @return {amounts[1]}
     */
    function swapTokenBToA(uint256 _amountIn) public returns(uint256) {
        address[] memory path = new address[](2);
        path[0] = USDC;
        path[1] = WETH;
        // Need to approve the token
        usdc.transferFrom(msg.sender, address(this), _amountIn);
        uint256[] memory amauntOutMin = router.getAmountsOut(_amountIn, path);
        usdc.approve(address(router), amauntOutMin[1]);
        uint256 balance = weth.balanceOf(msg.sender);
        // User gives WETH(18 decimal) and get USDC(6 decimal)
        uint256[] memory amounts = router.swapExactTokensForTokens(
            _amountIn,
            amauntOutMin[1],
            path,
            msg.sender,
            block.timestamp
        );
        // The balance must be changed minimum on {amauntOutMin[1]}  
        require(weth.balanceOf(msg.sender) >= balance + amauntOutMin[1], 'Balance not changed');
        emit Swapped(amounts[1], msg.sender);
        // amounts[1] = WETH amount
        return amounts[1];
    }
}