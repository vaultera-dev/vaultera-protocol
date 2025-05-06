// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/release/extensions/integration-manager/integrations/adapters/UniswapV3Adapter.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployUniswapV3Adapter is Script {
    // Define constants for the constructor parameters
    address public immutable integrationManagerAddress = Addresses.INTEGRATION_MANAGER; // Replace with actual IntegrationManager address
    address public constant routerAddress = 0xE592427A0AEce92De3Edee1F18E0157C05861564; // Provided Uniswap V3 Router address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the UniswapV3Adapter contract with the provided constructor values
        UniswapV3Adapter uniswapV3Adapter = new UniswapV3Adapter(integrationManagerAddress, routerAddress);

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(uniswapV3Adapter)); // Return the deployed contract address
    }
}
