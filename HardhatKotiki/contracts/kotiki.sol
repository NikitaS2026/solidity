// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Kotiki{
    address private person;
    string public cat;
    uint256 public fish = 5;
    uint256 private fishForCat = 3;

    event meow(address);
    event scratch(address);

    constructor() {person = msg.sender;}

    function head(bool canPat) public{
        require(canPat == true, "*scratch");
        emit meow(msg.sender);
        fish += 1;
        cat = "- meow";
    }
    function back() public{
        emit scratch(msg.sender);
        fish -= 1;
        cat = "*scratch";
    }
    function send() public{
        require(fish >= fishForCat, "*scrach");
        fish -= fish;
        cat = "- meow";
    }
    function frozen() public{
        require(fish < fishForCat, "give the cat a fish!");
        fish += fishForCat;
    }
}