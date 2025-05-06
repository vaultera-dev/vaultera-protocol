// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import "forge-std/Script.sol";
import "./../../contracts/release/extensions/integration-manager/integrations/adapters/TransferAssetsAdapter.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

//deploy-main
contract DeployTransferAssetsAdapter is Script {
    // Define constant for the constructor parameter
    address public immutable integrationManagerAddress = Addresses.INTEGRATION_MANAGER; // Replace with actual IntegrationManager address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the TransferAssetsAdapter contract with the provided constructor value
        TransferAssetsAdapter transferAssetsAdapter = new TransferAssetsAdapter(integrationManagerAddress);

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(transferAssetsAdapter)); // Return the deployed contract address
    }
}
