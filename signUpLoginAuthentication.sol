pragma solidity >=0.8.7;
//SPDX-License-Identifier: MIT

contract SingUpLogin {

    mapping(address => string) private UserAuthentication;
    mapping(address => bool) private UserIsRegistered;
    mapping(address=> address) private OwnerIs;

    function signUp(string memory _password) public returns(bool) {
        require(!UserIsRegistered[msg.sender],"U have Already SignUp goto Login ");
        UserAuthentication[msg.sender]=_password;
        UserIsRegistered[msg.sender]=true;
        OwnerIs[msg.sender]=msg.sender;
        return true;
    }
    function resetPassword(address _user,string memory _newPassword) external returns(string memory){
        require(UserIsRegistered[msg.sender],"only User can own resetPassword,If you haven't SigneedUp plz SignUp");
        require(OwnerIs[msg.sender]==msg.sender,"U can'not Reset Password");
        UserAuthentication[_user]=_newPassword;
        return "Password is Successfully Updated";
    }

    function logIn(address _user, string  memory _password) public  view returns (string memory){
        require(UserIsRegistered[_user],"SignUp before Login");
        address userIs= _user;
        string memory passwordIs= _password;
       {
         if(
            keccak256(abi.encodePacked(userIs)) == keccak256(abi.encodePacked(OwnerIs[userIs]))
            && 
            keccak256(abi.encodePacked(passwordIs)) == keccak256(abi.encodePacked(UserAuthentication[userIs]))
         ) {
            return "Successfully LogIn";
         }
         else{
         return "User address or Password is Incorrect Try Again";
         }
        }

}
}