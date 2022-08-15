pragma solidity 0.8.4;
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

contract Vendor is Ownable {

  event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);
  event SellTokens(address seller, uint256 amountOfETH, uint256 amountOfTokens);

  YourToken public yourToken;
  
  uint256 public constant tokensPerEth = 100;
  uint256 public constant decimal = 10 ** 18;

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
  function withdraw() public payable onlyOwner {  
    uint256 amount = msg.value * decimal;
    
    yourToken.transfer(msg.sender, amount);
  }

  // ToDo: create a sellTokens(uint256 _amount) function:
  function sellTokens(uint256 amount) public {
        
    uint256 getAmount = amount / tokensPerEth;
    yourToken.transferFrom(msg.sender, address(this), amount);
    //yourToken.approve(address(this), amount);
    payable(msg.sender).transfer(getAmount);
    
    emit SellTokens(msg.sender, getAmount, amount);
  }
  
  receive() external payable{}

}
