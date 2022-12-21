// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IAlienCodex {
    function contact() external returns (bool);

    function codex() external returns (bytes32[] memory);

    function make_contact() external;

    function record(bytes32 _content) external;

    function retract() external;

    function revise(uint256 i, bytes32 _content) external;

    function owner() external returns (address);
}
