// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
import {SimpleStorage} from "./SimpleStorage.sol";

contract  AddFiveStorage is SimpleStorage {
    // function sayHello() public pure returns (string memory) {
        function store (uint256 _newNumber) public override {
            myFavoriteNumber = _newNumber + 5;

        }

    }


