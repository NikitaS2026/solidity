// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./soap.sol";
import "./bricks.sol";

contract BarterExchange{

    Soap private SoapToken;
    Bricks private BrickToken;

    uint256 public bricksForOneSoap = 10;

    constructor(address _soap, address _bricks) {
        SoapToken = Soap(_soap);
        BrickToken = Bricks(_bricks);
    }

    function exchangeBricksForSoap (uint256 brickAmount) public {
        require(brickAmount % bricksForOneSoap == 0, "you balbes");
        BrickToken.transferFrom(msg.sender, address(this), brickAmount);
        SoapToken.transfer(msg.sender, brickAmount/bricksForOneSoap);
    }

}

