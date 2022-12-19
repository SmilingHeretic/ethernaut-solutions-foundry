// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IKing {
    function prize() external view returns (uint256);

    receive() external payable;
}
