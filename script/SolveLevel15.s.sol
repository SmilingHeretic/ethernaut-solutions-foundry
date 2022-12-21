// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/INaughtCoin.sol";

contract SolveLevel15 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0x3A78EE8462BD2e31133de2B8f1f9CBD973D6eDd6;
        value = 0;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        INaughtCoin instance = INaughtCoin(instanceAddress);

        instance.approve(player, instance.balanceOf(player));
        instance.transferFrom(player, address(1), instance.balanceOf(player));
    }
}
