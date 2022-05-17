// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.10;

import "hardhat/console.sol";

contract Domains {
  mapping(string => address) public domains;

  // Checkout our new mapping! This will store values
  mapping(string => string) public records;

  constructor() {
    console.log("THIS IS MY DOMAINS CONTRACT. NICE.");
  }

  function register(string calldata name) public {
    require(domains[name] == address(0), "this domain is not avaiable");
    
    domains[name] = msg.sender;
    console.log("%s has registered a domain!", msg.sender);
  }

  function getAddress(string calldata name) public view returns (address) {
    return domains[name];
  }

  function setRecord(string calldata name, string calldata record) public {
    // Check that the owner is the transaction sender
    require(domains[name] == msg.sender, "this domain is not your");
    records[name] = record;
  }

  function getRecord(string calldata name) public view returns(string memory) {
    return records[name];
  }
}