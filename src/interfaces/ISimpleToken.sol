// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface ISimpleToken {
    function destroy(address payable _to) external;
}
