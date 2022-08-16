# 🏗 scaffold-eth | 🏰 BuidlGuidl

## 🚩 Challenge 2: 🏵 Token Vendor 🤖

> 🏵 `YourToken.sol` smart contract inherits the **ERC20** token standard from OpenZeppelin. Set your token to `_mint()` **1000** (\* 10 \*\* 18) tokens to the `msg.sender`.
>  `Vendor.sol` contract sells your token using a payable `buyTokens()` function.

> 🎛 Edit the frontend that invites the user to `<input\>` an amount of tokens they want to buy. We'll display a preview of the amount of ETH (or USD) it will cost with a confirm button.

> 🔍 Your token's source code is verified in the block explorer after deployment. 

> 🌟 The final deliverable is an app that lets users purchase your ERC20 token, transfer it, and sell it back to the vendor.

---

### Checkpoint 2: 🏵Your Token 💵

> 👩‍💻 `YourToken.sol` inherits the **ERC20** token standard from OpenZeppelin

> Mint **1000** (\* 10 \*\* 18) to the frontend address using the `constructor()`.

### Checkpoint 3: ⚖️ Vendor 🤖

> 👩‍💻 **payable** `buyTokens()` function in `Vendor.sol` contract 

Use a price variable named `tokensPerEth` set to **100**:

> 📝 The `buyTokens()` function in `Vendor.sol` should use `msg.value` and `tokensPerEth` to calculate an amount of tokens to `yourToken.transfer()` to `msg.sender`.

> 📟 Emit **event** `BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens)` when tokens are purchased.

#### 🥅 Goals

- [X] Correct error when trying to buy tokens from the vendor: **'ERC20: transfer amount exceeds balance'**

⚠️ this is because the Vendor contract doesn't have any YourTokens yet!

⚔️ Side Quest: send tokens from your frontend address to the Vendor contract address and *then* try to buy them.

> ✏️ We can't hard code the vendor address like we did above when deploying to the network because we won't know the vendor address at the time we create the token contract. 

> ✏️ So instead, edit `YourToken.sol` to transfer the tokens to the `msg.sender` (deployer) in the **constructor()**.

#### 🥅 Goals

- [X] `Vendor` address starts with a `balanceOf` **1000** in `YourToken` on the `Debug Contracts` tab
- [X] Able to buy **10** tokens for **0.1** ETH
- [X] Able to transfer tokens to a different account


> 📝 Call `transferOwnership()` on the `Vendor` to make *your frontend address* the `owner`:

#### 🥅 Goals

- [ ] Is your frontend address the `owner` of the `Vendor`?

> 📝 Finally, add a `withdraw()` function in `Vendor.sol` that lets the owner withdraw ETH from the vendor.

#### 🥅 Goals

- [ ] Can **only** the `owner` withdraw the ETH from the `Vendor`?

#### ⚔️ Side Quests

- [ ] Can _anyone_ withdraw? Test _everything_!
- [ ] What if you minted **2000** and only sent **1000** to the `Vendor`?

---

### Checkpoint 4: 🤔 Vendor Buyback 🤯

🧐 The reason why this is hard is the `approve()` pattern in ERC20s.

😕 First, the user has to call `approve()` on the `YourToken` contract, approving the `Vendor` contract address to take some amount of tokens.

🤨 Then, the user makes a *second transaction* to the `Vendor` contract to `sellTokens(uint256 amount)`.

#### 🥅 Goal

- [X] Can you sell tokens back to the vendor?
- [X] Do you receive the right amount of ETH for the tokens?

#### ⚔️ Side Quest

- [X] Add Sell Token Events display.  

#### ⚠️ Test it!

Contract tested -- all pass.

----

### Checkpoint 5: 💾 Deploy to Goerli! 🛰

---
### Checkpoint 6: 🚢 Ship it! 🚁

📦 Run `yarn build` to package up the frontend.

💽 Upload the app to surge with `yarn surge` with  `"surge": "surge ./build",` in `packages/react-app/package.json`

---
### Checkpoint 7: 📜 Contract Verification

Vendor verified address: 0xaBa9c9c3e624Ca8D969C72CE99251b8974D0050e

---
