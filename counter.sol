// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Counter{
    // Firstly we need one counter, this keep our value
    uint public count = 0;
    //After, we can changed out counter up and down owing to both function
    function increase() external returns(uint){
        return count+=1;
    }
    function decrease() external returns(uint){
        return count-=1;
    }
} 