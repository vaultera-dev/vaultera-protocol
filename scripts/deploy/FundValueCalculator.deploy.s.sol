// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/release/off-chain/FundValueCalculator.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployFundValueCalculator is Script {
    address public immutable feeManager = Addresses.FEE_MANAGER;
    address public immutable protocolFeeTracker = Addresses.PROTOCOL_FEE_TRACKER;
    address public immutable valueInterpreter = Addresses.VALUE_INTERPRETER;

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        FundValueCalculator valueInterpreter = new FundValueCalculator(feeManager, protocolFeeTracker, valueInterpreter);

        vm.stopBroadcast();

        return (address(valueInterpreter));
    }
}
