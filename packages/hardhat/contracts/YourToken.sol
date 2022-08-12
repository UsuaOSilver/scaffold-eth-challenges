pragma solidity 0.8.4;
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// learn more: https://docs.openzeppelin.com/contracts/3.x/erc20

contract YourToken is ERC20 {
    constructor() ERC20("Sou", "SOU") {
        _mint(0xaf613770cB500BdAb0ee5d8Cefe9D701C88D6486, 1000 * 10 ** 18);
    }
}
