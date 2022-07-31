// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./StoreAndMap.sol";

contract Factory {
	StoreAndMap[] public SAMArray;

	function createSAMContract() public {
		StoreAndMap sam = new StoreAndMap();
		SAMArray.push(sam);
	}

	function factoryStore(uint256 _samIndex, uint256 _samNumber) public {
		// We need an Address and an ABI
		SAMArray[_samIndex].store(_samNumber);
	}

	function factoryGet(uint256 _samIndex) public view returns (uint256) {
		return SAMArray[_samIndex].retrieve();
	}
}
