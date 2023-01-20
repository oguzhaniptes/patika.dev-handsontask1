// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract FeeCollector{
    address public owner;
    uint256 public balance;
    constructor (){
        owner = msg.sender;
    }
    receive() payable external {
        balance += msg.value;
    }

    function withDraw(uint _amount, address payable _destAddress) checkBalance(_amount) onlyOwner public{

        _destAddress.transfer(_amount);
        balance -= _amount;
    }

    modifier onlyOwner{
        require(msg.sender == owner, "You can't withdraw, you're not owner!");
        _;
    }

    modifier checkBalance(uint _amount){
        require(_amount <= balance, "Insufficient funds");
        _;
    }

}