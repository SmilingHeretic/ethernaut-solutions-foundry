// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IGatekeeperTwo.sol";
import "../src/exploits/GatekeeperTwoExploit.sol";

contract SolveLevel14 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0xF781b45d11A37c51aabBa1197B61e6397aDf1f78;
        value = 0;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        IGatekeeperTwo instance = IGatekeeperTwo(instanceAddress);
        GatekeeperTwoExploit exploit = new GatekeeperTwoExploit(instance);
    }
}
