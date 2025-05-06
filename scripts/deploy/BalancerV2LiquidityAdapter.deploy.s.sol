// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/release/extensions/integration-manager/integrations/adapters/BalancerV2LiquidityAdapter.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployBalancerV2LiquidityAdapter is Script {
    // Define constants for the constructor parameters
    // address public immutable integrationManagerAddress = Addresses.INTEGRATION_MANAGER; // Replace with actual IntegrationManager address
    // address public constant balancerVaultAddress = 0xBA12222222228d8Ba445958a75a0704d566BF2C8; // Provided Balancer Vault address
    // address public constant balancerMinterAddress = 0x0000000000000000000000000000000000000000; // Provided Balancer Minter address (0 address in this case)
    // address public constant balTokenAddress = 0x040d1EdC9569d4Bab2D15287Dc5A4F10F56a56B8; // Provided Balancer Token address


    //ethereum mainnet
    address public immutable integrationManagerAddress = Addresses.INTEGRATION_MANAGER; // Replace with actual IntegrationManager address
    address public constant balancerVaultAddress = 0xba12222222228d8ba445958a75a0704d566bf2c8; // Provided Balancer Vault address
    address public constant balancerMinterAddress = 0x239e55f427d44c3cc793f49bfb507ebe76638a2b; // Provided Balancer Minter address (0 address in this case)
    address public constant balTokenAddress = 0xba100000625a3754423978a60c9317c58a424e3d; // Provided Balancer Token address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the BalancerV2LiquidityAdapter contract with the provided constructor values
        BalancerV2LiquidityAdapter liquidityAdapter = new BalancerV2LiquidityAdapter(
            integrationManagerAddress, balancerVaultAddress, balancerMinterAddress, balTokenAddress
        );

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(liquidityAdapter)); // Return the deployed contract address
    }
}
