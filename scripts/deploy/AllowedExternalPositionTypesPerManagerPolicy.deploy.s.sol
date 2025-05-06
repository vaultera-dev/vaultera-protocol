// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import
    "./../../contracts/release/extensions/policy-manager/policies/asset-managers/AllowedExternalPositionTypesPerManagerPolicy.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployAllowedExternalPositionTypesPerManagerPolicy is Script {
    // Define constants for the PolicyManager and UintListRegistry addresses
    address public immutable policyManagerAddress = Addresses.POLICY_MANAGER; // Replace with actual PolicyManager address
    address public immutable uintListRegistryAddress = Addresses.UINT_LIST_REGISTRY; // Replace with actual UintListRegistry address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the AllowedExternalPositionTypesPerManagerPolicy contract with the provided addresses
        AllowedExternalPositionTypesPerManagerPolicy policyContract =
            new AllowedExternalPositionTypesPerManagerPolicy(policyManagerAddress, uintListRegistryAddress);

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(policyContract)); // Return the deployed contract address
    }
}
