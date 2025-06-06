pragma solidity ^0.8.0;

contract MyToken {
    string public name = "My Token";
    string public symbol = "MT";
    uint256 public totalSupply = 1000000;
    uint8 public decimals = 18;
    mapping(address => uint256) public balanceOf;

    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

    event Transfer(address indexed from, address indexed to, uint256 value);

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
}
}