// SPDX-License-Identifier: GPL-3.0 
pragma solidity ^0.8.2;
contract Counter{

    uint public counter;
     function Increment() public{
         counter++;
     }
      
    function Decrement() public {
        counter--;
    }
    function Reset() public {
        counter=0;
    }
}