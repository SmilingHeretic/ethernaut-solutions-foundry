// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IGatekeeperTwo {
    function enter(bytes8 _gateKey) external returns (bool);
}
