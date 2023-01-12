// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IGoodSamaritan {
    function requestDonation() external returns (bool enoughBalance);
}
