// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

interface IExchangePair {
    function exchange(address user, uint256 amount) external returns (uint256);
}

