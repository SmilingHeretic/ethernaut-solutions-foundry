// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/Test.sol";
import "../src/interfaces/IEthernaut.sol";

contract SolveLevelBase is Script {
    IEthernaut ethernaut =
        IEthernaut(0x73379d8B82Fda494ee59555f333DF7D44483fD58);

    function run() external {
        uint256 playerPrivateKey = vm.envUint("PRIVATE_KEY");
        address player = vm.addr(playerPrivateKey);

        vm.startBroadcast(playerPrivateKey);

        (address levelAddress, uint256 value) = getInstanceCreationData();
        address instanceAddress = getNewInstance(levelAddress, value);
        solveLevel(instanceAddress, player);
        submitInstance(instanceAddress);

        vm.stopBroadcast();
    }

    function getNewInstance(
        address levelAddress,
        uint256 valueForInstanceCreation
    ) internal returns (address instanceAddress) {
        vm.recordLogs();
        ethernaut.createLevelInstance{value: valueForInstanceCreation}(
            levelAddress
        );
        Vm.Log[] memory entries = vm.getRecordedLogs();
        instanceAddress = address(
            uint160(uint256(entries[entries.length - 1].topics[2]))
        );
    }

    function submitInstance(address instanceAddress) internal {
        ethernaut.submitLevelInstance(payable(instanceAddress));
    }

    function solveLevel(address instanceAddress, address player)
        internal
        virtual
    {}

    function getInstanceCreationData()
        internal
        pure
        virtual
        returns (address levelAddress, uint256 value)
    {}
}
