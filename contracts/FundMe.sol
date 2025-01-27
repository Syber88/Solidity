// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract FundMe {

    uint256 public minimumUsd = 5;
    function fund() public payable{
        
        require(msg.value >= 1e18, "didn't send enough eth"); 

    }

    // function withdraw ()
}
