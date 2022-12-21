// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/exploits/ForceExploit.sol";

contract SolveLevel7 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0x80934BE6B8B872B364b470Ca30EaAd8AEAC4f63F;
        value = 0;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        ForceExploit exploit = new ForceExploit{value: 0.001 ether}();

        exploit.exploit(payable(instanceAddress));
    }
}
