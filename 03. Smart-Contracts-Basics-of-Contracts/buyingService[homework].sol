pragma solidity ^0.4.18;

contract Core {
    address public owner;
    
    event OwnerShipOfServiceChange(address newAdress, uint transaction);
    
    uint public fixedAmount = 1 ether;
    uint public fixedtime = 2 minutes;
    uint public lastTransaction = 0;
    
    uint public oneHour = 60 minutes;
    uint public maxEthers = 5 ether;
    uint public lastWidraw = 0;
    
    modifier ownerOnly{require(msg.sender == owner);_;}
    
    modifier isAllowedToWidraw(uint amount){
        require(amount<maxEthers);
        require(now - lastWidraw >= oneHour);
        _;
    }
    
    function Core() payable public {
        owner = msg.sender;
    }
    
    function checkIfPositive(uint amount) private pure returns (bool isPositive){
       return amount > 0 ? true : false;
    }
    
    function() payable public{}
    
    function getBalance() public view returns(uint,uint){
        return (this.balance,msg.sender.balance);
    }
    
    function withDraw(uint money) public ownerOnly isAllowedToWidraw(money){
        owner.transfer(money);
        lastWidraw = now;
    }
    
    function buyService()public payable{
        uint diff = msg.value - fixedAmount;
        bool isPositive = checkIfPositive(diff);
        if(isPositive){
             msg.sender.transfer(diff);
    }
           
        lastTransaction = now;
        OwnerShipOfServiceChange(msg.sender, lastTransaction);
    }
}