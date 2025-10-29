## chain-memory 🧠 memochain

**memochain** is a simple Solidity-based smart contract that acts as an **on-chain memory vault**.  
It allows users to store, view, and update short text "memories" directly on the blockchain —  
making every thought permanent, timestamped, and transparent.

---

## 🌍 Overview

This project demonstrates how to create a **chain-based memory system** using Solidity.  
Each memory entry is stored with:
- The author's Ethereum address  
- A timestamp  
- The actual memory text  

Anyone can add a new memory, while only the author can edit their own entry.  
The contract owner also has the ability to remove the last memory if needed.

---

## ✨ Features

- 📝 Add new text memories on-chain  
- 🔍 Retrieve and read all stored memories  
- ✏️ Update your own memories (author-only)  
- 🧹 Owner can remove the most recent memory  
- 🔒 Transparent & immutable storage (demo-safe)

---
##URL
https://celo-sepolia.blockscout.com/tx/0xd1709d4e2276a61cf599118925e82fc8ef3a92241edde0f53be53ce751ea77a1

##SCREENSHOT
![WhatsApp Image 2025-10-29 at 14 21 36_ee18a4e8](https://github.com/user-attachments/assets/8b926f32-f5ed-4278-94f1-c366f1c6236e)


## ⚙️ Smart Contract Details

**File Name:** `blockchain.sol`  
**Contract Name:** `blockchain`  
**Compiler Version:** `^0.8.19`

---

## 🧰 Tech Stack

- **Language:** Solidity  
- **Blockchain:** Ethereum / EVM-compatible  
- **Tools:** Remix IDE, MetaMask  

---


```solidity

