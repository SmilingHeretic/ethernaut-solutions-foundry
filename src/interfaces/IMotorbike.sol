// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IMotorbike {
    function upgrader() external view returns (address);

    function horsePower() external view returns (uint256);

    function initialize() external;

    function upgradeToAndCall(address newImplementation, bytes calldata data)
        external
        payable;
}
