// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.8;
import "@openzeppelin/contracts/access/Ownable.sol";
contract WhitelistContract is Ownable {

    mapping(address => bool) public whitelist;

  
    function addToWhitelist(address[] calldata toAddAddresses) 
    external onlyOwner
    {
        for (uint i = 0; i < toAddAddresses.length; i++) {
            whitelist[toAddAddresses[i]] = true;
        }
    }

    
    function removeFromWhitelist(address[] calldata toRemoveAddresses)
    external onlyOwner
    {
        for (uint i = 0; i < toRemoveAddresses.length; i++) {
            delete whitelist[toRemoveAddresses[i]];
        }
    }

    
    function whitelistFunc() external view returns(bool)
    {
        require(whitelist[msg.sender], "You are not in white list");
        return true;

    }
}