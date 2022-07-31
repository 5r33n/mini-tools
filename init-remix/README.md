# init-remix

This repository is for you to see how to compile and deploy smart contracts on [remix](https://remix.ethereum.org).

## Simple Storage

### SPDX License Identifier

The first line `// SPDX-License-Identifier: MIT` which comes as a comment is not exactly a comment, it's a license identifier.

SPDX License Identifiers can be used to indicate relevant license information at any level, from package to the source code file level. Accurately identifying the license for open source software is important for license compliance.

### Structs

Struct types are used to represent a record. Here on line 8 we're creating a struct of People who have a `name` of type `string` and a `favoriteNumber` of type `uint256`.

### Mapping

Mapping in Solidity acts like a hash table or dictionary in any other language. These are used to store the data in the form of key-value pairs, a key can be any of the built-in data types but reference types are not allowed while the value can be of any type. Mappings are mostly used to associate the unique Ethereum address with the associated value type.

On line 13 we've defined a dictionary of people. On line 15 we've defined a mapping from `string` to `uint256` which takes a name and maps it to a favorite number.

### Functions

#### store

In this function on line 17 the store function simply takes a `uint256` number and stores it as a favorite number.

#### retrieve

This function gets called without any gas fee and returns the `favoriteNumber` stored by `store` function.

#### addPerson

This function takes the two parameters of `_name` and `_favoriteNumber` from the user, stores them to `people` accepting these parameters. Furthermore, it maps the name to the favorite number they've entered on line 27.

### Public Functions

Public functions/ Variables can be used both externally and internally. For public state variable, Solidity automatically creates a getter function.

## Factory
