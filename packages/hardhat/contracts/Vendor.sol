pragma solidity 0.8.4;
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

contract Vendor is Ownable {

  event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);

  YourToken public yourToken;
  
  uint public constant tokenPerETH = 100;

  constructor(address tokenAddress) {
    yourToken = YourToken(tokenAddress);
  }

  // ToDo: create a payable buyTokens() function:
  function buyToken() public payable {
    
    uint256 paidAmount = msg.value * tokenPerETH;
    
    yourToken.transfer(msg.sender, paidAmount);
    
    // emit the event
    emit BuyTokens(msg.sender, msg.value, paidAmount);
  }

  // ToDo: create a withdraw() function that lets the owner withdraw ETH

  // ToDo: create a sellTokens(uint256 _amount) function:

}
