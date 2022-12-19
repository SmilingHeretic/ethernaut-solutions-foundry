// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IVault {
    function unlock(bytes32 _password) external;
}
