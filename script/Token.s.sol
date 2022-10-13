// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Token.sol";

// forge script script/Token.s.sol:DeployLuxe --rpc-url $TESTNET_RPC_URL --broadcast --verify -vvvv

contract DeployLuxe is Script {
    function setUp() public {}

    function run() public {
				uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
				vm.startBroadcast(deployerPrivateKey);
				Token token = new Token("LuxeToken", "LUXE", 18, 1_000_000);
				vm.stopBroadcast();
    }
}
