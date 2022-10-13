// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// Token.sol
// Inflationary ERC20 token.

import "solmate/tokens/ERC20.sol";

interface IERC20 {
    function balanceOf(address) external returns (uint256);
    function transfer(address to, uint256 amount) external;
}

contract Token is ERC20 {
    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 initialSupply
    ) ERC20(name, symbol, decimals) {
        _mint(msg.sender, initialSupply);
    }
}
