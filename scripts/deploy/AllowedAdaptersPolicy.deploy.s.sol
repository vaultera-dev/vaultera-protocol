// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/release/extensions/policy-manager/policies/asset-managers/AllowedAdaptersPolicy.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployAllowedAdaptersPolicy is Script {
    address public immutable policyManager = Addresses.POLICY_MANAGER;
    address public immutable addressListRegistry = Addresses.ADDRESS_LIST_REGISTRY;

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        AllowedAdaptersPolicy allowedAdaptersPolicy = new AllowedAdaptersPolicy(policyManager, addressListRegistry);

        vm.stopBroadcast();

        return (address(allowedAdaptersPolicy));
    }
}
