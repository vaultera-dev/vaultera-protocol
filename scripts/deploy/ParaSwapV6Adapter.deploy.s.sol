// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import "./../../contracts/release/extensions/integration-manager/integrations/adapters/ParaSwapV6Adapter.sol";
import "forge-std/console.sol";
import "./Addresses.sol";
import "./../../contracts/external-interfaces/IParaSwapV6AugustusSwapper.sol";
contract DeployParaSwapV6Adapter is Script {
    // Define constants for the constructor parameters
    address public immutable integrationManagerAddress = Addresses.INTEGRATION_MANAGER; // Replace with actual IntegrationManager address
    address public constant augustusSwapperAddress = 0x6A000F20005980200259B80c5102003040001068; // Provided Augustus Swapper address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the ParaSwapV6Adapter contract with the provided constructor values
        ParaSwapV6Adapter paraSwapV6Adapter = new ParaSwapV6Adapter(
            integrationManagerAddress, 
            IParaSwapV6AugustusSwapper(augustusSwapperAddress)
        );

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(paraSwapV6Adapter)); // Return the deployed contract address
    }
}
