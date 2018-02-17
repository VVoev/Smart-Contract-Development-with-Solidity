/*
Write a contract, that:
Can accept ETH
Has N number of owners (a list of owners given in constructor)
A proposal can be made to transfer funds to an account (make it a struct)
For the proposal to be accepted, each owner must agree in the order defined in the list
For the second owner to agree, the first one has to agree first.
The same logic for all owners
If all agree within 5 minutes of the proposal, the proposal is accepted and the funds are transferred
Include the necessary constraints
*/

pragma solidity ^0.4.19;

contract ConnsensusOfOwners {
   address[] public owners;
   
   struct Proposal {
       uint256 amount;
       address receiver;
       uint256 transactionTime;
   }
   
   Proposal public currentProposal;
   uint256 public nextToApprove;
   
   modifier onlyOwner(){
       bool isOwner;
       for (uint256 i = 0; i < owners.length; ++i) {
           if (owners[i] == msg.sender) {
               isOwner = true;
               break;
           }
       }
       require(isOwner == true);
       _;
   }
   modifier hasEnoughtMoney(uint money){require(this.balance > money);_;}
   modifier isFiveMinutesPass {require(now - currentProposal.transactionTime >= 5 minutes); _;}
   modifier checkIfThingsAreGettingOutOfBounce{require(nextToApprove <= owners.length);_;}
   function () public payable { }
   
   function ConnsensusOfOwners (address[] _owners) public payable {
       owners = _owners;
       nextToApprove = 0;
   }
   
   function createProposal(address _receiver, uint _amount) public hasEnoughtMoney(_amount) isFiveMinutesPass {
       currentProposal = Proposal(_amount,_receiver,now);
       nextToApprove = 0;
   }
   
   function approve() public onlyOwner checkIfThingsAreGettingOutOfBounce {
       require(now - currentProposal.transactionTime <= 5 minutes);
       require(owners[nextToApprove] == msg.sender);
       require(currentProposal.amount < this.balance);
       nextToApprove++;
      
   }
   
   function getBalance() public view returns(uint) {
       return this.balance;
   }
}