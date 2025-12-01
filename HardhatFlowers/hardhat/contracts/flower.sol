// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./dye.sol";

contract Flowers {

//внутри контракта
    address owner;
    uint256 public totalFlowersQuantity;
    Dyes public dye;

//из контракта dye
//    address dyeAddress;

    constructor (uint256 _totalFlowersQuantity) {
        totalFlowersQuantity = _totalFlowersQuantity;
//        dyeAddress = _dyeAddress;
        owner = msg.sender;
        dye = new Dyes();
    }

    mapping (address => uint256) public balanceFlowers;

//собрать
    function collect() public  {
        balanceFlowers[msg.sender] += 1;
        totalFlowersQuantity -= 1;
    }

//выкинуть
    function quit(uint256 amount) public  {
        balanceFlowers[msg.sender] -= amount;
        totalFlowersQuantity -= amount;
    }

//отдать пользователю
    function give(address recipient, uint256 amount) public  {
        require(balanceFlowers[msg.sender] >= amount, "you cant do it");
        balanceFlowers[msg.sender] -= amount;
        balanceFlowers[recipient] += amount;
    }

    function mintFlower(uint256 amount) public {
        require(balanceFlowers[msg.sender] >= amount, "you cant do it");
        balanceFlowers[msg.sender] -= amount;
        totalFlowersQuantity -= amount;
        dye.mintDye(msg.sender, amount);
    }

}