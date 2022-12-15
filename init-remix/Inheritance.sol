// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./StoreAndMap.sol"

contract Inheritance is StoreAndMap {
	function store(uint256 _favoriteNumber) public override {
		favoriteNumber = _favoriteNumber + 10;
	}
}
