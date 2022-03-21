// SPDX-License-Identifier: none
pragma solidity ^0.8.13;
contract HelloBitbank {
    string message;
    constructor()  {
        message = 'hello bitbank!';
    }
    function set(string memory new_message) public{
        message = new_message;
    }
    function get() public view returns (string memory out_message){
        return message;
    }
}
