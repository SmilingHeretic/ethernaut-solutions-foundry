// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IPreservation {
    function setFirstTime(uint256 _timeStamp) external;

    function setSecondTime(uint256 _timeStamp) external;
}
