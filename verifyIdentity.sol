pragma solidity >=0.8.7;
//SPDX-License-Identifier: MIT

contract verifyIdentity {
    mapping(address => bytes32) private getStudentHash;
    mapping(bytes32=> bool) private isStudentRegistered;
    mapping(address=> address) private user;
    address public admin;

    constructor(){
        admin=msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender==admin, "only onwer can access this");
        _;
    }

    function issueStudentCard(address student,string memory name, string memory class) external onlyOwner returns(string memory){
        bytes32 hash = keccak256(abi.encode(student, name, class)); 
        isStudentRegistered[hash]=true;
        getStudentHash[student]=hash;
        return "Record Added Successfuly";   
    }

    function verifyStudentRecord(bytes32 _studentHash) public view returns(bool){
        return isStudentRegistered[_studentHash];
    }

    function StudentHash() external view returns(bytes32){
        return getStudentHash[msg.sender];
    }
}