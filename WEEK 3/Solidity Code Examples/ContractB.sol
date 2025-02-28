//SPDX-License-Identifier: MIT
 pragma solidity 0.8.25;
import './MyContract.sol';
contract ContractB {
    function interactWithMyContract(uint x) public returns(uint){
        MyContract myObj = new MyContract();//0xc4d5177E415a5f5116Dc07Db14273f2755Ef7aAe;
        myObj.setNum(x);
        return myObj.getNum();
    }
}