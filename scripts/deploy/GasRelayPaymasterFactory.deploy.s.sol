// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/release/infrastructure/gas-relayer/GasRelayPaymasterFactory.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployGasRelayPaymasterFactory is Script {
    // Define constants for the constructor parameters
    address public immutable dispatcherAddress = Addresses.DISPATCHER;
    address public immutable gasRelayPaymasterLibAddress = Addresses.GAS_RELAY_PAYMASTER_LIB;

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the GasRelayPaymasterFactory contract with the provided constructor values
        GasRelayPaymasterFactory paymasterFactory =
            new GasRelayPaymasterFactory(dispatcherAddress, gasRelayPaymasterLibAddress);

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(paymasterFactory)); // Return the deployed contract address
    }
}
