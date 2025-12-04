// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./ERC-20.sol";

contract Soap is ERC20 {
    
    constructor()
    ERC20("Soap", "SOAP", 18) 
    {
        
    }

}