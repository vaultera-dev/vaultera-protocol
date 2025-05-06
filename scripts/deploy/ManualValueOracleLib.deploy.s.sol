// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/persistent/arbitrary-value-oracles/manual-value/ManualValueOracleLib.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployManualValueOracleLib is Script {
    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the ManualValueOracleLib contract (no constructor)
        ManualValueOracleLib manualValueOracleLib = new ManualValueOracleLib();

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(manualValueOracleLib)); // Return the deployed contract address
    }
}
