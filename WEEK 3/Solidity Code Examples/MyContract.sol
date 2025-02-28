//SPDX-License-Identifier: MIT
 pragma solidity 0.8.25;
contract MyContract{
    uint num; //state variable
    function getNum() public view returns(uint){
        return num;
    }
    function setNum(uint x)public {
        num = x;
    }
}
