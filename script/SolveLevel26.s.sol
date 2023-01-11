// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IDoubleEntryPoint.sol";
import "../src/interfaces/IForta.sol";
import "../src/exploits/DoubleEntryPointBot.sol";

contract SolveLevel26 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0x40055E69E7EB12620c8CCBCCAb1F187883301c30;
        value = 0;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        IDoubleEntryPoint instance = IDoubleEntryPoint(instanceAddress);
        DoubleEntryPointBot bot = new DoubleEntryPointBot(instance);

        IForta forta = IForta(instance.forta());
        forta.setDetectionBot(address(bot));
    }
}
