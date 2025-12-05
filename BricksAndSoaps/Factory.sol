// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./IExchangePair.sol";
import "./BrickSoapPair.sol";

contract Factory {

    mapping (address => address) public tokenAddresses; 

    function createPair(address tokenA, address tokenB, uint256 rate) public {
        BrickSoapPair pairContract = new BrickSoapPair(tokenA, tokenB, rate);
        tokenAddresses[msg.sender] = address(pairContract);
    }

    function executeTrade(address tokenA, uint256 amount) public {
        address _pairInterface = tokenAddresses[tokenA];
        IExchangePair pairInterface = IExchangePair(_pairInterface);
        pairInterface.exchange(tokenA, amount);
    }
}