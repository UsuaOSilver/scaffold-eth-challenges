pragma solidity 0.8.4;
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

contract Vendor is Ownable {

  event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);

  YourToken public yourToken;
  
  uint public constant tokensPerEth = 100;

  constructor(address tokenAddress) {
    yourToken = YourToken(tokenAddress);
  }

  // ToDo: create a payable buyTokens() function:
  function buyTokens() public payable {
    
    uint256 paidAmount = msg.value * tokensPerEth;
    
    yourToken.transfer(msg.sender, paidAmount);
    
    // emit the event
    emit BuyTokens(msg.sender, msg.value, paidAmount);
  }

  // ToDo: create a withdraw() function that lets the owner withdraw ETH
  function withdraw() public payable{
    require(_msgSender() == owner());
    
    uint256 amount = msg.value * 10 ** 18;
    
    yourToken.transfer(msg.sender, amount);
  }

  // ToDo: create a sellTokens(uint256 _amount) function:

}
