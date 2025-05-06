// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import
    "./../../contracts/release/extensions/policy-manager/policies/asset-managers/AllowedExternalPositionTypesPolicy.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployAllowedExternalPositionTypesPolicy is Script {
    address public immutable policyManager = Addresses.POLICY_MANAGER; // provided PolicyManager address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        AllowedExternalPositionTypesPolicy allowedExternalPositionTypesPolicy =
            new AllowedExternalPositionTypesPolicy(policyManager);

        vm.stopBroadcast();

        return (address(allowedExternalPositionTypesPolicy));
    }
}
