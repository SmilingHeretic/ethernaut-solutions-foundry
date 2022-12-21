// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IMagicNum.sol";

contract SolveLevel18 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0x4A151908Da311601D967a6fB9f8cFa5A3E88a251;
        value = 0;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        IMagicNum instance = IMagicNum(payable(instanceAddress));

        bytes
            memory solverBytecode = hex"600a80600d6000396000f300fe602a60805260206080f3";
        address solverAddress;
        assembly {
            solverAddress := create(
                0,
                add(solverBytecode, 0x20),
                mload(solverBytecode)
            )
        }
        instance.setSolver(solverAddress);
    }
}
