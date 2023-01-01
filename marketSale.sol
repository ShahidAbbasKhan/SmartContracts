// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract marketSale {
    address public owner;
    uint price;
    event Deployed (address indexed adr);
    event ForSale (uint price, uint blokTime);
    event Transfer (address indexed owner, address indexed newOwner);
    event Purchase (uint amount, address indexed buyer);
    constructor(){
        owner=msg.sender;
        emit Deployed(owner);

    }
    function transfer(address adr) external {
        require(msg.sender==owner,"you are not owner");
        require(adr!= owner,"You are already owner");
        owner=adr;
        emit Transfer (msg.sender,owner);
    }
    function markPrice(uint _price) external{
        require(msg.sender==owner,"you are not owner");
        require(_price> 0,"Price can't be zero");
         price= _price;
     emit ForSale(price,block.timestamp);
    }
    function purchase() external payable {
        require(msg.value==price, "Invalid Amount");
        require(price>0, "Price is Invalid");
        require(msg.sender!=address(0) && msg.sender !=owner, "invalid address and owner can't purchase");
        (bool sent,)=owner.call{value:msg.value}("");
        require(sent, "Can't send Amount to Owner");
        price=0;
        owner= msg.sender;
        emit Purchase (msg.value, msg.sender);
        
    }
    
}