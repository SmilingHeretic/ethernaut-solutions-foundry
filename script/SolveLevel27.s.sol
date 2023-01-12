// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IGoodSamaritan.sol";
import "../src/exploits/GoodSamaritanExploit.sol";

contract SolveLevel27 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0xD0a78dB26AA59694f5Cb536B50ef2fa00155C488;
        value = 0;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        IGoodSamaritan instance = IGoodSamaritan(instanceAddress);
        GoodSamaritanExploit exploit = new GoodSamaritanExploit();

        exploit.exploit(instance);
    }
}
