//SPDX-License-Identifier: MIT
pragma solidity 0.8.25;
library MyLib{
    function power (uint x, uint y) public pure returns (uint){
        uint res=1;
        for(uint i=1;i<=y;i++){
            res = res*x;
        }
        return res;
    }
    function isEven(uint x) public pure returns(bool){
        if(x%2==0)
        return true;
        else
        return false;
    }
}
contract MyContract{
    using MyLib for uint;
    function pow(uint a, uint b) public pure returns(uint){
        return a.power(b);
        // Sees that a is of type uint. Since we have mentioned using MyLib for uint, compiler goes to  MyLib and search for power function and gives remaining parameters into it (a will be taken as first parameter).
    }

    function evenorNot(uint a) public pure returns(bool){
        return a.isEven();
    }
}