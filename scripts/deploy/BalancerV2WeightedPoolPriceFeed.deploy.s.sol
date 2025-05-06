// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/release/infrastructure/price-feeds/derivatives/feeds/BalancerV2WeightedPoolPriceFeed.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployBalancerV2WeightedPoolPriceFeed is Script {
    // Define constants for the constructor parameters
    // address public immutable fundDeployerAddress = Addresses.FUND_DEPLOYER; // Replace with actual FundDeployer address
    // address public immutable valueInterpreterAddress = Addresses.VALUE_INTERPRETER; // Replace with actual ValueInterpreter address
    // address public constant intermediaryAssetAddress = 0x82aF49447D8a07e3bd95BD0d56f35241523fBab1; // Provided intermediary asset (WETH)
    // address public constant balancerVaultAddress = 0xBA12222222228d8Ba445958a75a0704d566BF2C8; // Provided Balancer Vault address
    // address[] public poolFactories; // Empty array for pool factories


    //ethereum mainnet

     address public immutable fundDeployerAddress = Addresses.FUND_DEPLOYER; // Replace with actual FundDeployer address
    address public immutable valueInterpreterAddress = Addresses.VALUE_INTERPRETER; // Replace with actual ValueInterpreter address
    address public constant intermediaryAssetAddress = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2; // Provided intermediary asset (WETH)
    address public constant balancerVaultAddress = 0xBA12222222228d8Ba445958a75a0704d566BF2C8; // Provided Balancer Vault address
    address[] public poolFactories; // Empty array for pool factories

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the BalancerV2WeightedPoolPriceFeed contract with the provided constructor values
        BalancerV2WeightedPoolPriceFeed balancerV2WeightedPoolPriceFeed = new BalancerV2WeightedPoolPriceFeed(
            fundDeployerAddress, valueInterpreterAddress, intermediaryAssetAddress, balancerVaultAddress, poolFactories
        );

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(balancerV2WeightedPoolPriceFeed)); // Return the deployed contract address
    }
}
