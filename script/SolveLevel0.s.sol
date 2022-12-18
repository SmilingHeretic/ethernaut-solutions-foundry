// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IHelloEthernaut.sol";

contract SolveLevel0 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0x3049C00639E6dfC269ED1451764a046f7aE500c6;
        value = 0;
    }

    function solveLevel(address instanceAddress) internal override {
        IHelloEthernaut instance = IHelloEthernaut(instanceAddress);
        instance.authenticate("ethernaut0");
    }
}
