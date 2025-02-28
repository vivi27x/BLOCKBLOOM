// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;
contract StudentRegister{
    struct DOB{
        uint month;
        uint day;
        uint year;
    }
    enum Program{
        ug,
        pg
    }

    struct Student{
        string name;
        DOB dob;
        Program program;
        bool enrolled;
    }
    mapping (address=>Student) studentRegister;
    address deployer;
    uint ugCount;
    uint pgCount;
    // Student public S;
    modifier checkOwner{
        require(msg.sender == deployer,"You do not have access to this info since your are not owner of this contract");
        _;
    }
    function setStudent(string memory _name,uint _day,uint _month,uint _year,Program _program) public
    {
        studentRegister[msg.sender].name = _name;
        studentRegister[msg.sender].dob.day = _day;
        studentRegister[msg.sender].dob.month = _month;
        studentRegister[msg.sender].dob.year = _year;
        studentRegister[msg.sender].program = _program;
        studentRegister[msg.sender].enrolled = false;
        // studentRegister[msg.sender] = S;
    }

    constructor(){
        deployer = msg.sender;
    }

    function getStudent() public view returns(string memory,uint,uint,uint,Program){
        return (studentRegister[msg.sender].name,studentRegister[msg.sender].dob.day,studentRegister[msg.sender].dob.month,studentRegister[msg.sender].dob.year,studentRegister[msg.sender].program);
    }

    function getCountUG() public checkOwner view returns(uint){
        return ugCount;
    }
    function getCountPG() public checkOwner view returns(uint){
        return pgCount;
    }

    function enrollStudent() public payable{
        if(uint(studentRegister[msg.sender].program) == 0)
        {
            require(msg.value >= 0.02 ether,"Insufficient fee(Pay atleast 0.02 ether to be enrolled)");
                studentRegister[msg.sender].enrolled = true;
                payable(msg.sender).transfer(msg.value - 0.02 ether);
                ugCount++;
        }
        else
        {
            require(msg.value >= 0.01 ether,"Insufficient fee(Pay atleast 0.01 ether to be enrolled)");
                studentRegister[msg.sender].enrolled = true;
                payable(msg.sender).transfer(msg.value - 0.01 ether);
                pgCount++;
        }
    }

    event Log(address,string);

    fallback() external payable {
        // This function is executed on a call to the contract if none of the other
        // functions match the given function signature, or if no data is supplied at all
        emit Log(msg.sender,"In the fallback function");
    }

    receive() external payable {
        // This function is executed when a contract receives plain Ether (without data)
        emit Log(msg.sender,"In the receive function");
    }

//                   Send Ether
//                       |
//            msg.data is empty?
//                 /           \
//             yes             no
//              |                |
//     receive() exists?     fallback()
//         /        \
//      yes          no
//       |            |
//   receive()     fallback()

}