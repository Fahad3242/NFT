## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

---

# Project Overview

This project implements a basic NFT (Non-Fungible Token) smart contract using Solidity. The contract allows minting unique tokens and demonstrates fundamental NFT functionality.

The main contract is `BasicNft.sol` located in the `src/` directory. It follows the ERC-721 standard for NFTs.

# Deployment

The project includes a deployment script `DeployBasicNft.s.sol` located in the `script/` directory. You can deploy the BasicNft contract using Foundry's scripting capabilities:

```shell
forge script script/DeployBasicNft.s.sol:DeployBasicNft --rpc-url <your_rpc_url> --private-key <your_private_key> --broadcast
```

Replace `<your_rpc_url>` and `<your_private_key>` with your Ethereum node RPC URL and private key respectively.

# Testing

Tests for the BasicNft contract are located in `test/BasicNftTest.t.sol`. You can run the tests using Forge:

```shell
forge test
```

This will execute the test suite and verify the functionality of the BasicNft contract.
