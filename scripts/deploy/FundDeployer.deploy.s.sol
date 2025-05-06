// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/release/core/fund-deployer/FundDeployer.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployFundDeployer is Script {
    address public immutable dispatcher = Addresses.DISPATCHER;
    address public immutable gasRelayPaymasterFactory = Addresses.GAS_RELAY_PAYMASTER_FACTORY;

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        FundDeployer fundDeployer = new FundDeployer(dispatcher, gasRelayPaymasterFactory);

        vm.stopBroadcast();

        return (address(fundDeployer));
    }
}
