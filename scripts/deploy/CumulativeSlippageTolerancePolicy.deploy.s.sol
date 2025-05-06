// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import
    "./../../contracts/release/extensions/policy-manager/policies/asset-managers/CumulativeSlippageTolerancePolicy.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployCumulativeSlippageTolerancePolicy is Script {
    // Define constants for the constructor parameters
    address public immutable policyManagerAddress = Addresses.POLICY_MANAGER; // Replace with actual PolicyManager address
    address public immutable addressListRegistryAddress = Addresses.ADDRESS_LIST_REGISTRY; // Replace with actual AddressListRegistry address
    address public immutable valueInterpreterAddress = Addresses.VALUE_INTERPRETER; // Replace with actual ValueInterpreter address
    // address public constant wethTokenAddress = 0x82aF49447D8a07e3bd95BD0d56f35241523fBab1; // Provided WETH address
    // uint256 public constant bypassableAdaptersListId = 1; // Provided value
    // uint256 public constant tolerancePeriodDuration = 604800; // 7 days in seconds
    // uint256 public constant pricelessAssetBypassTimelock = 604800; // 7 days in seconds
    // uint256 public constant pricelessAssetBypassTimeLimit = 172800; // 2 days in seconds


    //ethereum
    uint256 public constant bypassableAdaptersListId = 1; // Provided value
    address public constant wethTokenAddress = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2; // Provided WETH address
    uint256 public constant tolerancePeriodDuration = 604800; // 7 days in seconds
    uint256 public constant pricelessAssetBypassTimelock = 604800; // 7 days in seconds
    uint256 public constant pricelessAssetBypassTimeLimit = 172800; // 2 days in seconds

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the CumulativeSlippageTolerancePolicy contract with the provided constructor values
        CumulativeSlippageTolerancePolicy policyContract = new CumulativeSlippageTolerancePolicy(
            policyManagerAddress,
            addressListRegistryAddress,
            valueInterpreterAddress,
            wethTokenAddress,
            bypassableAdaptersListId,
            tolerancePeriodDuration,
            pricelessAssetBypassTimelock,
            pricelessAssetBypassTimeLimit
        );

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(policyContract)); // Return the deployed contract address
    }
}
