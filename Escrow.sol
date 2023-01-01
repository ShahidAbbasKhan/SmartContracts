// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Escrow {
    address public depositor; 
    address public beneficiary;
    address public arbiter;
    bool public isApproved;
    event Approved (uint balance);
    constructor(address _arbiter,address _beneficiary) payable{
        arbiter= _arbiter;
        beneficiary= _beneficiary;
        depositor= msg.sender;
    }
    function approve() external {
        require(msg.sender== arbiter,"Only arbiter can approve");
        uint balance=address(this).balance;
        (bool sent,)= payable(beneficiary).call{value:balance}("");
        require(sent, "can't sent to beneficiary");
        emit Approved(balance);
        isApproved=true;
    }
}