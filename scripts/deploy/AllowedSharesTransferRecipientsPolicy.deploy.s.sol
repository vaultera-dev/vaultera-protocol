// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import
    "./../../contracts/release/extensions/policy-manager/policies/new-shareholders/AllowedSharesTransferRecipientsPolicy.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployAllowedSharesTransferRecipientsPolicy is Script {
    // Define constants for the PolicyManager and AddressListRegistry addresses
    address public immutable policyManagerAddress = Addresses.POLICY_MANAGER; // Replace with actual PolicyManager address
    address public immutable addressListRegistryAddress = Addresses.ADDRESS_LIST_REGISTRY; // Replace with actual AddressListRegistry address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the AllowedSharesTransferRecipientsPolicy contract with the provided addresses
        AllowedSharesTransferRecipientsPolicy policyContract =
            new AllowedSharesTransferRecipientsPolicy(policyManagerAddress, addressListRegistryAddress);

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(policyContract)); // Return the deployed contract address
    }
}
