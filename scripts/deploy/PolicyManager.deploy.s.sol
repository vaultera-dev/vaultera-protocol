// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/release/extensions/policy-manager/PolicyManager.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployPolicyManager is Script {
    address public immutable fundDeployer = Addresses.FUND_DEPLOYER;
    address public immutable gasRelayPaymasterFactory = Addresses.GAS_RELAY_PAYMASTER_FACTORY;

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        PolicyManager policyManager = new PolicyManager(fundDeployer, gasRelayPaymasterFactory);

        vm.stopBroadcast();

        return (address(policyManager));
    }
}
