pragma solidity ^0.4.18;

contract Faucet {
    
    address public owner;
    uint public sendAmount = 1 ether;

  
    function Faucet() payable public{
        owner = msg.sender;
    }
    
    function() payable public{}
    modifier ownerOnly{require(msg.sender == owner); _;}
    modifier hasEnoughtBalance(uint amount){require (this.balance> amount);_;}
    event MoneyhasBeenWithDrawn(uint amount,address addressWithdrawn);
    event SendAmountHasChanged(uint amount);
    
    function getBalance() public view returns(uint){
        return this.balance;
    }
    
    function sendMoneyToAnother(address anotherAdress) public payable hasEnoughtBalance(sendAmount){
        anotherAdress.transfer(sendAmount);
    
    }
    
    function changeSendAmount(uint256 newAmountToBeSend)public ownerOnly{
        sendAmount = newAmountToBeSend;
        SendAmountHasChanged(newAmountToBeSend);
    }
    
    function destroyContract() public ownerOnly{
        selfdestruct(owner);
    }
    
    function withdrawMoney(uint amount) public ownerOnly hasEnoughtBalance(amount){
        owner.transfer(amount);
        MoneyhasBeenWithDrawn(amount,owner);
    }
}