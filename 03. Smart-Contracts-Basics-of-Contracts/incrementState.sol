pragma solidity ^0.4.18;
contract ChangeOwner {
    
  uint state;
  address owner;
  uint currentTime;
  
  function ChangeOwner() public {
      owner = msg.sender;
      currentTime = now;
  }
  
  
  function incrementState() public{
      if(now - currentTime >=15){
          state++;
          currentTime = now;
      }
  }
  
  function getState() public returns(uint){
      return state;
  }
}