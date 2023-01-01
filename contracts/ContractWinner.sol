//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.17;

contract ContractWinner {
    address owner;
    address targetContract;

    constructor() {
      owner = msg.sender;
      targetContract = 0xcF469d3BEB3Fc24cEe979eFf83BE33ed50988502; // https://goerli.etherscan.io/address/0xcF469d3BEB3Fc24cEe979eFf83BE33ed50988502#code
    }

    function attempt() external {
      require(msg.sender == owner, "Only the owner can attempt to win the contract");
      
      (bool success,) = targetContract.call(abi.encodeWithSignature("attempt()"));
      require(success, "Attempt failed!");
    }
}

