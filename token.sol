// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    string public name; // Token Name
    string public symbol; // Token Symbol / Abbreviation
    uint256 public totalSupply; // Total Supply

    mapping(address => uint256) public balances; // Mapping of addresses to balances

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _totalSupply
    ) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
        balances[msg.sender] = _totalSupply; // Assign total supply to contract creator
    }

    // mint function
    function mint(address _to, uint256 _value) public {
        require(_value > 0, "Value must be greater than 0");
        totalSupply += _value;
        balances[_to] += _value;
    }

    // burn function
    function burn(address _from, uint256 _value) public {
        require(_value > 0, "Value must be greater than 0");
        require(balances[_from] >= _value, "Insufficient balance");

        totalSupply -= _value;
        balances[_from] -= _value;
    }
}

