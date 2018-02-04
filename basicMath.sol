pragma solidity ^0.4.19;

contract Mathematics{
  
  int256 result;
  
  function Mathematics() public{
      result = 0;
  }
  
  function increment(int256 incrementWith) public {
      result+= incrementWith;
  }
  
  function subtract(int256 decrementWith) public {
      result -= decrementWith;
  }
  
  function multiPly(int256 multiPlyWith) public {
      result*= multiPlyWith;
  }
  
  function deductBy(int256 deductWith) public {
      result/=deductWith;
  }
  
   function currentResult() public returns (int256){
      return result;
  }
}
