// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IDoubleEntryPoint {
    function cryptoVault() external returns (address);

    function forta() external returns (address);

    function delegatedFrom() external returns (address);

    function delegateTransfer(
        address to,
        uint256 value,
        address origSender
    ) external returns (bool);
}
