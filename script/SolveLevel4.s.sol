// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/ITelephone.sol";
import "../src/exploits/TelephoneExploit.sol";

contract SolveLevel4 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0x131c3249e115491E83De375171767Af07906eA36;
        value = 0;
    }

    function solveLevel(address instanceAddress) internal override {
        ITelephone instance = ITelephone(instanceAddress);
        TelephoneExploit exploit = new TelephoneExploit(instance);

        exploit.exploit();
    }
}
