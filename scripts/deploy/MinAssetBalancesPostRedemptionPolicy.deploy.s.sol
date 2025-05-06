// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import
    "./../../contracts/release/extensions/policy-manager/policies/current-shareholders/MinAssetBalancesPostRedemptionPolicy.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployMinAssetBalancesPostRedemptionPolicy is Script {
    // Define a constant for the PolicyManager address
    address public immutable policyManagerAddress = Addresses.POLICY_MANAGER; // Replace with actual PolicyManager address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the MinAssetBalancesPostRedemptionPolicy contract with the PolicyManager address
        MinAssetBalancesPostRedemptionPolicy policyContract =
            new MinAssetBalancesPostRedemptionPolicy(policyManagerAddress);

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(policyContract)); // Return the deployed contract address
    }
}
