# 🏗 scaffold-eth | 🏰 BuidlGuidl

## 🚩 Challenge 0: 🎟 Simple NFT Example 🤓

## What I did:

🎫 Create a simple NFT to learn basics of 🏗 scaffold-eth.
🌟 The final deliverable is an app that lets users purchase and transfer NFTs.

1. Utilizing [👷‍♀️ HardHat](https://hardhat.org/getting-started/) to compile and deploy smart contracts.
2. Using template React app full of important Ethereum components and hooks. 
3. Deploying an NFT to a public network to share with friends and upload my app to a public web server! 🚀

---

# Checkpoint 0: 📦 Install 📚

Required: 
* [Git](https://git-scm.com/downloads)
* [Node](https://nodejs.org/dist/latest-v16.x/)  (🧨 Use Node v16 or a previous version as v17 may cause errors 🧨)
* [Yarn](https://classic.yarnpkg.com/en/docs/install/#mac-stable)

📱 Open http://localhost:3000 to see the app

---

# Checkpoint 1: ⛽️  Gas & Wallets 👛

## What I learned:

> 🔥 Using **burner wallets** 

> 👛 Explore how **burner wallets** work in 🏗 scaffold-eth by opening a new *incognito* window and navigate it to http://localhost:3000. 

![image](https://user-images.githubusercontent.com/2653167/142483685-d5c6a153-da93-47fa-8caa-a425edba10c8.png)

> 👨🏻‍🚒 When closing the incognito window, the account is gone forever. Burner wallets are great for local development but I still need to move to more permanent wallets when interact with public networks.

---

# Checkpoint 2: 🖨 Minting 

> ✏️ Minted some NFTs!  Click the `MINT NFT` button. 

![MintNFT](https://user-images.githubusercontent.com/12072395/145692116-bebcb514-e4f0-4492-bd10-11e658abaf75.PNG)


👀 Got the collectibles:

![nft3](https://user-images.githubusercontent.com/526558/124386983-48965300-dcb3-11eb-88a7-e88ad6307976.png)

👛 Opened an **incognito** window and navigate to http://localhost:3000 

🎟 Transferred an NFT to the incognito window address using the UI:

![nft5](https://user-images.githubusercontent.com/526558/124387008-58ae3280-dcb3-11eb-920d-07b6118f1ab2.png)

👛 Grabbed funds from the faucet to pay the gas & tried to mint an NFT from the incognito window. 

## What I learned:
Understand how things work together from the contract file to the deployment script and the frontend file by inspecting

🔏 `YourCollectible.sol` in `packages/hardhat/contracts`.

💼 `00_deploy_your_contract.js` in `packages/hardhat/deploy`.

📝 `App.jsx` in `packages/react-app/src`.

---

# Checkpoint 3: 💾 Deploy it! 🛰

## What I learned:

🛰 How to deploy to a public testnet

> Change the `defaultNetwork` in `packages/hardhat/hardhat.config.js` to `rinkeby`

![networkSelect](https://user-images.githubusercontent.com/12072395/146871168-29b3d87a-7d25-4972-9b3c-0ec8c979171b.PNG)

🔐 Generate a **deployer address** with `yarn run generate`

![nft7](https://user-images.githubusercontent.com/526558/124387064-7d0a0f00-dcb3-11eb-9d0c-195f93547fb9.png)

👛 View my **deployer address** using `yarn account` 

![nft8](https://user-images.githubusercontent.com/526558/124387068-8004ff80-dcb3-11eb-9d0f-43fba2b3b791.png)

⛽️ Use a faucet like [faucet.paradigm.xyz](https://faucet.paradigm.xyz/) or [rinkebyfaucet.com](https://www.rinkebyfaucet.com/) to fund the **deployer address**.

🚀 Deploy the NFT smart contract:

```sh
yarn deploy --network rinkeby
```

---

# Checkpoint 4: 🚢 Ship it! 🚁

## What I learned:

✏️ 1. Edited frontend `App.jsx` in `packages/react-app/src` to change the `targetNetwork` to `NETWORKS.rinkeby` in order to see the correct network in the frontend (http://localhost:3000)

![image](https://user-images.githubusercontent.com/2653167/142491593-a032ebf2-38c7-4d1c-a4c5-5e02485e21b4.png)

![nft10](https://user-images.githubusercontent.com/526558/124387099-9a3edd80-dcb3-11eb-9a57-54a7d370589a.png)

🦊 2. Distinguished the address I generated in the previous step to deploy the contract from the one I have configured in my wallet.

> 🎫 Got test ETH and mint a batch of NFTs on Rinkeby with the `MINT NFT` button.

![MintNFT2](https://user-images.githubusercontent.com/12072395/145692572-d61c971d-7452-4218-9c66-d675bb78a9dc.PNG)


📦 3. Built the frontend:

```sh
yarn build
```

💽 4. Uploaded my app to surge:
```sh
yarn surge
```
(also `yarn s3` or `yarn ipfs`)

>  😬 As a Windows user, change in the surge code in `packages/react-app/package.json` to just `"surge": "surge ./build",` is needed.

> ⚙ Got a permissions error so ran `yarn surge` again until getting a unique URL (I also could have customized it in the command line to fix the error)

⚠️ 5. Ran the automated testing function to make sure the app passes

```sh
yarn test
```
![testOutput](https://user-images.githubusercontent.com/12072395/152587433-8314f0f1-5612-44ae-bedb-4b3292976a9f.PNG)

---

# Checkpoint 5: 📜 Contract Verification

## What I learned:
⚠️📜✅ Steps to verify my contract on etherscan.

1. Update the `api-key` in `packages/hardhat/package.json` file. 

![Screen Shot 2021-11-30 at 10 21 01 AM](https://user-images.githubusercontent.com/9419140/144075208-c50b70aa-345f-4e36-81d6-becaa5f74857.png)

2. Ran the `yarn verify --network your_network` command to verify my contracts on etherscan 🛰

---

# Checkpoint 6: 💪 Flex!

👩‍❤️‍👨 Share my public url with a friend and ask them for their address to send them a collectible :)

![nft15](https://user-images.githubusercontent.com/526558/124387205-00c3fb80-dcb4-11eb-9e2f-29585e323037.gif)

---
