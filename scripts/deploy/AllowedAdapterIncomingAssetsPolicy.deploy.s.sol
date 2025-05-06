// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";

import
    "./../../contracts/release/extensions/policy-manager/policies/asset-managers/AllowedAdapterIncomingAssetsPolicy.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployAllowedAdapterIncomingAssetsPolicy is Script {
    address public immutable policyManager = Addresses.POLICY_MANAGER; // provided PolicyManager address
    address public immutable addressListRegistry = Addresses.ADDRESS_LIST_REGISTRY; // provided AddressListRegistry address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        AllowedAdapterIncomingAssetsPolicy allowedAdapterIncomingAssetsPolicy =
            new AllowedAdapterIncomingAssetsPolicy(policyManager, addressListRegistry);

        vm.stopBroadcast();

        return (address(allowedAdapterIncomingAssetsPolicy));
    }
}
