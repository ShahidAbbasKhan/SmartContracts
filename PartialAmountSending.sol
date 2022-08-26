//SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;
contract sendPartialAmount{
    
    mapping(address=>uint)  public AmountSend;

 function receiveBalance() public  payable {
    AmountSend[msg.sender] +=msg.value;
 }
 function showBalance() public view returns(uint){
    return address(this).balance;
 }
 function withDrawAmount(address payable  _to, uint _amount) public{
    require(AmountSend[msg.sender]>= _amount,"You have unsufficent Balance");
    AmountSend[msg.sender] -=_amount;
    _to.transfer(_amount);
 }
 
}