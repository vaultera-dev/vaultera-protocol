// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import
    "./../../contracts/release/extensions/policy-manager/policies/new-shareholders/AllowedDepositRecipientsPolicy.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployAllowedDepositRecipientsPolicy is Script {
    // Define constants for the PolicyManager and AddressListRegistry addresses
    address public immutable policyManagerAddress = Addresses.POLICY_MANAGER; // Replace with actual PolicyManager address
    address public immutable addressListRegistryAddress = Addresses.ADDRESS_LIST_REGISTRY; // Replace with actual AddressListRegistry address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the AllowedDepositRecipientsPolicy contract with the provided addresses
        AllowedDepositRecipientsPolicy policyContract =
            new AllowedDepositRecipientsPolicy(policyManagerAddress, addressListRegistryAddress);

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(policyContract)); // Return the deployed contract address
    }
}
