// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract FeeCollector{
    // create the variables we need
    address public owner;
    uint256 public balance;
    // we initially equate the contract owner as owner
    constructor (){
        owner = msg.sender;
    }
    // this special function make ether transfer
    receive() payable external {
        balance += msg.value;
    }
    // and this performs the transfer of the amount entered to the entered address
    function withDraw(uint _amount, address payable _destAddress) checkBalance(_amount) onlyOwner public{

        _destAddress.transfer(_amount);
        balance -= _amount;
    }
    // requirements
    modifier onlyOwner{
        require(msg.sender == owner, "You can't withdraw, you're not owner!");
        _;
    }

    modifier checkBalance(uint _amount){
        require(_amount <= balance, "Insufficient funds");
        _;
    }

}