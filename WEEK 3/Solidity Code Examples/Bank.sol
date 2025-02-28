// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;
contract Bank{
    mapping(address => uint) balanceLedge;
    
    modifier balanceCheck(uint amt){
        require(balanceLedge[msg.sender] >= amt,"Insufficient Balance");
        _;
    }

    function deposite() public payable{
        balanceLedge[msg.sender] += msg.value;
    }

    function withdraw(uint _amt) public balanceCheck(_amt){
        // require(balanceLedge[msg.sender] >= _amt,"Insufficient Balance");
        // if(balanceLedge[msg.sender] >= _amt)
        // {
            balanceLedge[msg.sender]-=_amt;
            payable(msg.sender).transfer(_amt);
        // }
    }

    function getBalance() public view returns (uint){
        return balanceLedge[msg.sender];
    }

    function transfer(uint _amt,address recipient) public balanceCheck(_amt){
            // require(balanceLedge[msg.sender] >= _amt,"Insufficient Balance");
        // if(balanceLedge[msg.sender] >= _amt)
        // {
            balanceLedge[msg.sender]-=_amt;
            payable(recipient).transfer(_amt);
        // }
    }
}