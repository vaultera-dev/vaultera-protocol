// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/persistent/arbitrary-value-oracles/manual-value/ManualValueOracleFactory.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployManualValueOracleFactory is Script {
    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the ManualValueOracleFactory contract (no constructor)
        ManualValueOracleFactory manualValueOracleFactory = new ManualValueOracleFactory();

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(manualValueOracleFactory)); // Return the deployed contract address
    }
}
