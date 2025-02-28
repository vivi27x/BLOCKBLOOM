// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;
contract Book {
    string title;
    uint8 price;
    bool sold;
    address public owner;

    address[] buyers;

    function setBook(string memory _title, uint8 _price) external {
        title = _title;
        price = _price;
        sold = false;
        owner = msg.sender;
    }
    function toWei(uint256 _price) public pure returns(uint)
    {
        return (_price * 1000000000000000000);
    }
    function buyBook() public payable { 
        if((msg.value / 1 ether) >= price) {
            owner = msg.sender;
            sold = true;
            buyers.push(msg.sender);
            uint256 balance = msg.value - toWei(price); // Can be done by price* 1 ether also.
            if(balance > 0) payable(msg.sender).transfer(balance);
        }
    }
    function getBook() public view returns (string memory, uint8, bool, address) {
        return (title, price, sold, owner);
    }
    function withdraw(uint val) internal {
        payable(msg.sender).transfer(val);
    }
    function getBuyers() public view returns(uint256,address[] memory){
        return (buyers.length,buyers);
    }
}