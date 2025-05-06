// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import
    "./../../contracts/release/extensions/policy-manager/policies/asset-managers/DisallowedAdapterIncomingAssetsPolicy.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

//main branch
contract DeployDisallowedAdapterIncomingAssetsPolicy is Script {
    // Define constants for the PolicyManager and AddressListRegistry addresses
    address public immutable policyManagerAddress = Addresses.POLICY_MANAGER; // Replace with actual PolicyManager address
    address public immutable addressListRegistryAddress = Addresses.ADDRESS_LIST_REGISTRY; // Replace with actual AddressListRegistry address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the DisallowedAdapterIncomingAssetsPolicy contract with the provided addresses
        DisallowedAdapterIncomingAssetsPolicy policyContract =
            new DisallowedAdapterIncomingAssetsPolicy(policyManagerAddress, addressListRegistryAddress);

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(policyContract)); // Return the deployed contract address
    }
}
