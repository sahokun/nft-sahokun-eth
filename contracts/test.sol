pragma solidity ^0.4.25;
contract HelloBitbank {
    string message;
    constructor() public {
        message = 'hello bitbank!';
    }
    function set(string new_message) public{
        message = new_message;
    }
    function get() public constant returns (string out_message){
        return message;
    }
}
