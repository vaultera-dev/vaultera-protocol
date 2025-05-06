// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/release/extensions/integration-manager/integrations/adapters/ParaSwapV5Adapter.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployParaSwapV5Adapter is Script {
    // Define constants for the constructor parameters
    address public immutable integrationManagerAddress = Addresses.INTEGRATION_MANAGER; // Replace with actual IntegrationManager address
    address public constant augustusSwapperAddress = 0xDEF171Fe48CF0115B1d80b88dc8eAB59176FEe57; // Provided Augustus Swapper address
    address public constant tokenTransferProxyAddress = 0x216B4B4Ba9F3e719726886d34a177484278Bfcae; // Provided Token Transfer Proxy address
    address public constant feePartnerAddress = 0x0000000000000000000000000000000000000000; // Provided Fee Partner address (0 address in this case)
    uint256 public constant feePercent = 0; // Provided fee percent

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the ParaSwapV5Adapter contract with the provided constructor values
        ParaSwapV5Adapter paraSwapV5Adapter = new ParaSwapV5Adapter(
            integrationManagerAddress, augustusSwapperAddress, tokenTransferProxyAddress, feePartnerAddress, feePercent
        );

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(paraSwapV5Adapter)); // Return the deployed contract address
    }
}
