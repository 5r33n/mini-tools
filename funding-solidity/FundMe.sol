// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./PriceConverter.sol";

error NotOwner();

contract FundMe {
	using PriceConverter for uint256;
	mapping(address => uint256) public addressToAmountFunded;
	address[] public funders;
	address public i_owner;
	uint256 public constant MINIMUM_USD = 50 * 10 ** 18; // minimum of 50 USD is required
	
	constructor() {
		i_owner = msg.sender;
	}

	function fund() public payable {
		require(msg.value.getConversionRate() >= MINIMUM_USD, "Spend more ETH!");
		addressToAmountFunded[msg.sender] += msg.value;
		funders.push(msg.sender);
	}

	function getVersion() public view returns (uint256) {
		AggregatorV3Interface priceFeed = AggregatorV3Interface(
			0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
		);
		return priceFeed.version();
	}

	modifier onlyOwner {
		if(msg.sender != i_owner) revert NotOwner();
		_;
	}

	function withdraw() payable onlyOwner public {
		for(uint256 funderIndex=0; funderIndex < funders.length; funderIndex++) {
			address funder = funders[funderIndex];
			addressToAmountFunded[funder] = 0;
		}
		funders = new address[](0);
		(bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
		require(callSuccess, "call failed");
	}

	fallback() external payable {
		fund();
	}

	receive() external payable {
		fund();
	}
}
