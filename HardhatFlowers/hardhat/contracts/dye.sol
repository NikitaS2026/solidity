// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Dyes {

//свои переменные
    address public owner;
    uint256 public totalDyesQuantity;

//из контракта flowers
    address public flowerAddress;

    constructor() {
        owner = msg.sender;
    }

    mapping (address => uint256) public balanceDyes;

//сделать краситель из цветка
    function mintDye(address recipient, uint256 amount) public {
        require(msg.sender == owner, "you cant do it");
        balanceDyes[recipient] += amount;
        totalDyesQuantity += amount;
    }

//передаю краситель другому челу
    function give(address recipient, uint256 amount) public  {
        require(balanceDyes[msg.sender] >= amount, "you cant do it");
        balanceDyes[msg.sender] -= amount;
        balanceDyes[recipient] += amount;
    }

}