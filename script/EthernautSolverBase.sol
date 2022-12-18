// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/Test.sol";
import "../src/interfaces/IEthernaut.sol";

contract EthernautSolverBase is Script {
    IEthernaut ethernaut =
        IEthernaut(0x73379d8B82Fda494ee59555f333DF7D44483fD58);
    address levelAddress;
    uint256 valueForInstanceCreation;

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        (address levelAddress, uint256 value) = getInstanceCreationData();
        address payable instanceAddress = getNewInstance(levelAddress, value);
        solveLevel(instanceAddress);
        submitInstance(instanceAddress);

        vm.stopBroadcast();
    }

    function getNewInstance(
        address levelAddress,
        uint256 valueForInstanceCreation
    ) internal returns (address payable instanceAddress) {
        vm.recordLogs();
        ethernaut.createLevelInstance{value: valueForInstanceCreation}(
            levelAddress
        );
        Vm.Log[] memory entries = vm.getRecordedLogs();
        instanceAddress = payable(
            address(uint160(uint256(entries[0].topics[2])))
        );
    }

    function submitInstance(address payable instanceAddress) internal {
        ethernaut.submitLevelInstance(payable(instanceAddress));
    }

    function solveLevel(address instanceAddress) internal virtual {}

    function getInstanceCreationData()
        internal
        pure
        virtual
        returns (address levelAddress, uint256 value)
    {}
}
