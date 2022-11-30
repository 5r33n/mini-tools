// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
	function getPrice() internal view returns (uint256) {
		AggregatorV3Interface priceFeed = AggregatorV3Interface(
			0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
		);
		(, int256 answer,,,) = priceFeed.latestRoundData();
		return uint256(answer * 10 ** 10);
	}

	function getConversionRate(uint256 ethAmount)
		internal
		view
		returns (uint256)
	{
		uint256 ethPrice = getPrice();

		// because both ethPrice and ethAmount have 10**18, we need to 
		// divide by 10**18 once to cancel it out
		uint256 ethAmountInUsd = (ethPrice * ethAmount) / 10 ** 18;
		return ethAmountInUsd;
	}
}

		
