// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IEthernaut {
    event LevelInstanceCreatedLog(address indexed player, address instance);
    event LevelCompletedLog(address indexed player, address level);

    function createLevelInstance(address _level) external payable;

    function submitLevelInstance(address payable _instance) external;
}
