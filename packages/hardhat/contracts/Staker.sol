// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "hardhat/console.sol";
import "./ExampleExternalContract.sol";

contract Staker {

  ExampleExternalContract public exampleExternalContract;

  constructor(address exampleExternalContractAddress) {
      exampleExternalContract = ExampleExternalContract(exampleExternalContractAddress);
  }

  // Collect funds in a payable `stake()` function and track individual `balances` with a mapping:
  // ( Make sure to add a `Stake(address,uint256)` event and emit it for the frontend <List/> display )
  mapping(address => uint256) public balances;
  
  uint256 public constant threshold = 1 ether;
  
  event Stake(address _staker, uint256 _amount);
  
  function stake() public payable{
    require(block.timestamp < deadline, "Staking is closed");
    balances[msg.sender] += msg.value;
    emit Stake(msg.sender, msg.value);
  }
    
  // After some `deadline` allow anyone to call an `execute()` function
  // If the deadline has passed and the threshold is met, it should call `exampleExternalContract.complete{value: address(this).balance}()`
  uint256 public deadline = block.timestamp + 30 seconds;
  bool openForWithdraw;
  
  function execute() public notCompleted {
    if (balances[msg.sender] >= threshold) {
      exampleExternalContract.complete{value: balances[msg.sender]}();
    } else {
      openForWithdraw = true;
    }
  }

  // If the `threshold` was not met, allow everyone to call a `withdraw()` function
  modifier notCompleted() {
    require(block.timestamp >= deadline, "Action is available after deadline");
    require(exampleExternalContract.complete == false, "Staking process is complete, Action is no longer available");
    _;
  }
    
  // Add a `withdraw()` function to let users withdraw their balance
  function withdraw() public notCompleted {
    require(balances[msg.sender] < threshold, "Threshold is met, withdraw is not available");
    require(openForWithdraw, "Withdraw is not available");
    require(balances[msg.sender] > 0, "No funds to withdraw");
    
    openForWithdraw = true;
    balances[msg.sender] = 0;
  }


  // Add a `timeLeft()` view function that returns the time left before the deadline for the frontend
  function timeLeft() public view returns (uint256) {
    if (block.timestamp >= deadline) {
      return 0;
    }
    return deadline - block.timestamp;
  }

  // Add the `receive()` special function that receives eth and calls stake()
  receive() external payable {
    stake();
  }

}
