// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Generate a random number
contract RandomNumber {
    function random() private view returns (uint) {
        uint hashNumber =  uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, msg.sender)));
        return hashNumber % 100;
    }
}
