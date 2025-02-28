// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

library StrLib{
    function repeatConcat(string memory str,uint n) public pure returns(string memory){
        string memory s;
        while(n>0)
        {
            s = string(abi.encodePacked(s,str));
            n--;
            //Used to concatenate strings.
        }
        return s;
    }

    function toString(uint n) public pure returns(string memory){
        string memory s;
        if(n == 0)
        {
            s = "0";
            return s;
        }
        uint temp = n;
        uint length;
        while(temp != 0)
        {
            length++;
            temp = temp/10;
        }

        bytes memory byts = new bytes(length);
        temp = n;
        uint k = length;
        while(temp != 0)
        {
            byts[--k] = bytes1(uint8(48 + temp%10));
            temp = temp/10;
        }
        s = string(byts);
        return s;
    }
}

contract StringTest{
    using StrLib for *;
    function concat(string memory str,uint n) public pure returns(string memory){
        return str.repeatConcat(n);
    }

    function stringConv(uint n) public pure returns(string memory){
        return n.toString();
    }


}