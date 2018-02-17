/*
Write a contract, that:
Has 3 kinds of states: locked, unlocked and restricted
The owner can change the state
Locked means that nobody can call public contract functions (even fallback)
Unlocked means that everyone can call contract functions
Restricted means that only the owner can call contract functions
Have a structure that contains a counter, a timestamp and an address
Have a function that increments the counter by one, sets the current timestamp and sets the address to that of the caller
*/

pragma solidity ^0.4.19;

contract Action {
    address public owner;
    enum State{Locked,Unlocked,Restricted}
    
    modifier onlyOwner() {require(msg.sender == owner); _;}
    modifier checkState(){
        require(currentState != State.Locked);
        
        if (currentState == State.Restricted) {
            require(msg.sender == owner);
        }
        _;
    }

    
    struct Info {
        uint256 timeStamp;
        address caller;
        uint256 counter;
    }
    
    Info public accountIfo;
    State currentState;
    
    function getCurrentState() public view returns(State) {
        return currentState;
    }
    
    function changeState(State newState) public onlyOwner() {
        currentState = newState;
        updateInfo();
    }
    
    function updateInfo() private {
        accountIfo = Info(now, msg.sender,++accountIfo.counter);
    }
    
   
   function Action() public {
       owner = msg.sender;
   }
}