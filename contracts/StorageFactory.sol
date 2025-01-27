//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public ListOfSimpleStorage;

    function createSimpleStorageContract() public {
        ListOfSimpleStorage.push(new SimpleStorage());
    }
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        SimpleStorage mySimpleStorage = ListOfSimpleStorage[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256){
        return ListOfSimpleStorage[_simpleStorageIndex].retrieve();
    }
}