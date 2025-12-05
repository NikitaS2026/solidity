// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./IExchangePair.sol";
import "./ERC-20.sol";

contract BrickSoapPair is IExchangePair{

    uint256 public bricksForOneSoap;
    ERC20 public erc1;
    ERC20 public erc2;

    constructor(address erc20_1, address erc20_2, uint256 forOneToTwo) {
        erc1 = ERC20(erc20_1);
        erc2 = ERC20(erc20_2);
        bricksForOneSoap = forOneToTwo;
    }

    function exchange(address user, uint256 amount) external returns (uint256){
        require(amount % bricksForOneSoap == 0, "you balbes");
        erc1.transferFrom(user, address(this), amount);
        erc2.transfer(user, amount / bricksForOneSoap);
        return amount / bricksForOneSoap;
    }

}

