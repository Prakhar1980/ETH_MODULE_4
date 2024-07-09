// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract MyToken is ERC20, Ownable, ERC20Burnable 
{
    event CustomLog(string message);
    constructor() ERC20("Degen", "DGN") {}
    
    // Function to create new tokens
    function createTokens(address to, uint256 amount) public onlyOwner
    {
        _mint(to, amount);
    }

    // Function to transfer tokens
    function sendTokens(address recipient, uint256 amount) external 
    {
        require(balanceOf(msg.sender) >= amount, "Not enough tokens");
        approve(msg.sender, amount);
        transferFrom(msg.sender, recipient, amount);
    }

    // Function to redeem tokens for items
    function redeemItem(uint256 itemId) public {
        uint256 tokenAmount;
        
        if (itemId == 1) {
            tokenAmount = 1;
        } else if (itemId == 2) {
            tokenAmount = 2;
        } else if (itemId == 3) {
            tokenAmount = 3;
        } else {
            emit CustomLog("Redemption failed");
            return;
        }

        _burn(msg.sender, tokenAmount);
        emit CustomLog("Item redeemed successfully");
    }

    // Function to check token balance
    function checkBalance() external view returns (uint256)
    {
        return balanceOf(msg.sender);
    }

    // Function to burn tokens
    function destroyTokens(uint256 amount) external 
    {
        require(balanceOf(msg.sender) >= amount, "Not enough tokens");
        _burn(msg.sender, amount);
        emit CustomLog("Tokens burned successfully");
    }

    // Override decimals to return 0
    function decimals() public pure override returns (uint8)
    {
        return 0;
    }
}
