//SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.7;

contract Destruction {

    mapping(address => uint) public balanceReceived;
    address payable owner;

    constructor(){
        owner=payable(msg.sender);
    }

    function receiveMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }
    function returningMoney() public view returns(uint) {
        return address(this).balance;
    }


    function withdrawMoney(address payable _to, uint _amount) public {
        require(balanceReceived[msg.sender]>= _amount, "You have not Enough Balance.");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    } 
    function destructContract() public  {
        require(msg.sender==owner,"You are not Owner");
        selfdestruct(owner);
    }
}
