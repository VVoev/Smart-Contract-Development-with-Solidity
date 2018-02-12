pragma solidity ^0.4.18;

contract Ownership {
    address public owner;
    
    function Ownership() public {
        owner = msg.sender;
    }
    
    event OwnerChange(address oldOwner, address newOwner);
    
    function transferOwnership(address newOwner) public {
        if (msg.sender == owner) {
            address tempOwner = owner;
            owner = newOwner;
            OwnerChange(tempOwner, newOwner);
        }
    }
}