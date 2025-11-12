// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Kotiki{
    address public people;
    string public cat;

    event meow(address);
    event scratch(address);

    constructor() {people = msg.sender;}

    function head() public{
        emit meow(msg.sender);
        cat = "- meow";
    }
    function back() public{
        emit scratch(msg.sender);
        cat = "*scratch";
    }
}