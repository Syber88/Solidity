// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {PriceConverter} from "./PriceConverter.sol" ;

error NotOwner();

contract FundMe {

    using PriceConverter for uint256;
    uint256 public constant MINIMUM_USD = 5e18;
    address[] public funders;
    address public immutable i_owner;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    constructor (){
        i_owner = msg.sender;
    }
    function fund() public payable{
        require(msg.value.getConversionRate() >= MINIMUM_USD, "didn't send enough eth"); 

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public {
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);
        // payable(msg.sender).transfer(address(this).balance);

        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");
        (bool callSuccess,) = payable (msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    modifier onlyOwner() {
        if(msg.sender != i_owner) {revert NotOwner();}
        _;
    }

}
