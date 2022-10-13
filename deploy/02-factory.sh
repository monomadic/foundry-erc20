#!/bin/sh
# forge build --contracts src/VaultFactory.sol
# forge flatten src/VaultFactory.sol > src/VaultFactory.flat.sol

forge create --constructor-args $FEE_ADDRESS $FEE_ADDRESS --private-key $PRIVATE_KEY src/VaultFactory.sol:VaultFactory

cast abi-encode "constructor(address,address)" $FEE_ADDRESS $FEE_ADDRESS
# cast abi-encode "constructor(address)" 0xd12813D2d564f60D6ca228fe845a0841F7a489C3
export CONSTRUCTOR_ABI=000000000000000000000000d12813d2d564f60d6ca228fe845a0841f7a489c3
export COMPILER_VERSION="v0.8.10+commit.fc410830" 

forge verify-contract --chain-id $CHAIN_ID --num-of-optimizations 200 --constructor-args $CONSTRUCTOR_ABI --compiler-version $COMPILER_VERSION $ADDRESS src/VaultFactory.sol:VaultFactory

forge verify-check
