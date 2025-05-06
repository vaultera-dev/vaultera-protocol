// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/release/extensions/integration-manager/integrations/adapters/OneInchV5Adapter.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployOneInchV5Adapter is Script {
    // Define constants for the constructor parameters
    // address public immutable integrationManagerAddress = Addresses.INTEGRATION_MANAGER; // Replace with actual IntegrationManager address
    // address public constant oneInchV5ExchangeAddress = 0x1111111254EEB25477B68fb85Ed929f73A960582; // Provided OneInchV5 Exchange address

    //ethereum mainnet
    address public immutable integrationManagerAddress = Addresses.INTEGRATION_MANAGER; // Replace with actual IntegrationManager address
    address public constant oneInchV5ExchangeAddress = 0x1111111254eeb25477b68fb85ed929f73a960582; // Provided OneInchV5 Exchange address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the OneInchV5Adapter contract with the provided constructor values
        OneInchV5Adapter oneInchAdapter = new OneInchV5Adapter(integrationManagerAddress, oneInchV5ExchangeAddress);

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(oneInchAdapter)); // Return the deployed contract address
    }
}
