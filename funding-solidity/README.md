# Funding in Solidity

Starting on top of the `FundMe.sol` contract, we import two contracts. One of them is `AggregatorV3Interface.sol` which is more precisely an interface, and is imported from a [Chainlink repo](https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol). The other one `PriceConverter.sol` is imported from the current directory.

# FundMe.sol

We've got 3 functions:
1. [fund](#fund)
2. [getVersion](#getversion)
3. [withdraw](#withdraw)

1 modifier: [onlyOwner](#onlyowner-modifier)

2 special function:
1. [receive](#receive)
2. [fallback](#fallback)

## Functions

### fund

Checks if the required minimum value is met.

### getVersion

Gets version of the `priceFeed` instance which returns the version of the `AggregatorV3Interface`.

### withdraw

Goes through the funders of this contract and sets their `addressToAmountFunded` mapping to zero. Next, the `funders` array is set to zero as well, on line 46 with `funders = new address[](0)`.

## onlyOwner Modifier

Reverts to the `NotOwner()` error before `withdraw()` function is executed on line 41.

## Special functions

Here's a small flowchart on how `fallback()` and `receive()` functions are called in order.

// Ether is sent to contract
//      is msg.data empty?
//          /   \ 
//         yes  no
//         /     \
//    receive()?  fallback() 
//     /   \ 
//   yes   no
//  /        \
//receive()  fallback()

### receive

If some ETH is received without any info, and if it's declared, this function is called.

### fallback

If either no info is sent, or no `receive` function exists in this contract, this function is called. 
