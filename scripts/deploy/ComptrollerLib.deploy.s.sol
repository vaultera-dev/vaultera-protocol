// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/release/core/fund/comptroller/ComptrollerLib.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployComptrollerLib is Script {
    // Define constants for the constructor parameters

    address public immutable dispatcherAddress = Addresses.DISPATCHER;
    address public immutable protocolFeeReserveAddress = Addresses.PROTOCOL_FEE_RESERVE_PROXY;
    address public immutable fundDeployerAddress = Addresses.FUND_DEPLOYER;
    address public immutable valueInterpreterAddress = Addresses.VALUE_INTERPRETER;
    address public immutable externalPositionManager = Addresses.EXTERNAL_POSITION_MANAGER;
    address public immutable feeManagerAddress = Addresses.FEE_MANAGER;
    address public immutable integrationManager = Addresses.INTEGRATION_MANAGER;
    address public immutable policyManagerAddress = Addresses.POLICY_MANAGER;
    address public immutable gasRelayPaymasterFactory = Addresses.GAS_RELAY_PAYMASTER_FACTORY;
    address public constant mlnTokenAddress = 0xec67005c4E498Ec7f55E092bd1d35cbC47C91892;
    address public constant wrappedNativeTokenAddress = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2; // Provided WETH address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the ComptrollerLib contract with the provided constructor values
        ComptrollerLib comptrollerLib = new ComptrollerLib(
            dispatcherAddress,
            protocolFeeReserveAddress,
            fundDeployerAddress,
            valueInterpreterAddress,
            externalPositionManager,
            feeManagerAddress,
            integrationManager,
            policyManagerAddress,
            gasRelayPaymasterFactory,
            mlnTokenAddress,
            wrappedNativeTokenAddress
        );

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(comptrollerLib)); // Return the deployed contract address
    }
}
