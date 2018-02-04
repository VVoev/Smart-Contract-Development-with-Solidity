pragma solidity ^0.4.19;

contract Mathematics{
  
  int256 result;
  
  function Mathematics() public{
      result = 0 ;
  }
  
  function increment(int256 incrementWith) public returns(int) {
      result += incrementWith;
      return result;
  } 
  
  function subtract(int256 decrementWith) public returns(int) {
       result -= decrementWith;
       return result;
  }
  
  function multiPly(int256 multiPlyWith) public returns(int) {
      result*= multiPlyWith;
      return result;
  }
  
  function deductBy(int256 deductWith)public returns(int) {
      result/=deductWith;
      return result;
  }
  
   function currentResult() public view returns (int256){
      return result;
  }
  
  function resetToZero() public {
      result = 0 ;
  }
}
