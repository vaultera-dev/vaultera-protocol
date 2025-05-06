// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "forge-std/console.sol";

import "./../../contracts/release/extensions/external-position-manager/ExternalPositionManager.sol";
import "./Addresses.sol";

contract DeployExternalPositionManager is Script {
    address public immutable fundDeployer = Addresses.FUND_DEPLOYER;
    address public immutable externalPositionFactory = Addresses.EXTERNAL_POSITION_FACTORY;
    address public immutable policyManager = Addresses.POLICY_MANAGER;

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        ExternalPositionManager externalPositionManager =
            new ExternalPositionManager(fundDeployer, externalPositionFactory, policyManager);

        vm.stopBroadcast();

        return (address(externalPositionManager));
    }
}
