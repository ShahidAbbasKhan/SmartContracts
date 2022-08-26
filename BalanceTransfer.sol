// SPDX-License-Identifier: GPL-3.0 
pragma solidity ^0.8.2;
contract showBalances{
    address private owner;
    constructor(){
        owner=msg.sender;
    }

    function receiveBalance() public payable {

    }
    function showBalance() public view returns(uint) {
        return address(this).balance;
    }
    function sendBalance( address payable Add) public  {
        require(msg.sender==owner,"You are Not Owner");
        address payable to= payable (Add);
         to.transfer(showBalance());
    }


}