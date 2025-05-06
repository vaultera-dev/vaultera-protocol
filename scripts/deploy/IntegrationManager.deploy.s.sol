// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/release/extensions/integration-manager/IntegrationManager.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployIntegrationManager is Script {
    address public immutable fundDeployer = Addresses.FUND_DEPLOYER;
    address public immutable policyManager = Addresses.POLICY_MANAGER;
    address public immutable valueInterpreter = Addresses.VALUE_INTERPRETER;

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        IntegrationManager integrationManager = new IntegrationManager(fundDeployer, policyManager, valueInterpreter);

        vm.stopBroadcast();

        return (address(integrationManager));
    }
}
