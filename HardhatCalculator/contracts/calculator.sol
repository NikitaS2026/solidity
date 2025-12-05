// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Calculator {

    int256 public currentResult;
    address public owner;

    constructor () {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    event Operation(address indexed user, string operationType, int256 value, int256 result);

    function reset() public onlyOwner{
        currentResult = 0;
    }

    function add(int256 value) public {
        emit Operation(msg.sender, "add", value, currentResult);
        currentResult += value;
    } 

    function subtract(int256 value) public {
        emit Operation(msg.sender, "subtract", value, currentResult);
        currentResult -= value;
    }

    function multiply(int256 value) public {
        emit Operation(msg.sender, "multiply", value, currentResult);
        currentResult *= value;
    }

    function divide(int256 value) public {
        require(value != 0, "Error: Division by zero is not allowed");
        emit Operation(msg.sender, "divide", value, currentResult);
        currentResult /= value;
    }
}