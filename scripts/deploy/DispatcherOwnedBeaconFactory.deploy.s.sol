// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import "./../../contracts/utils/0.8.19/dispatcher-owned-beacon/DispatcherOwnedBeaconFactory.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

//deploy-main
contract DeployDispatcherOwnedBeaconFactory is Script {
    // Define constants for the constructor parameters
    address public immutable dispatcherAddress = Addresses.DISPATCHER; // Replace with actual Dispatcher address
    address public immutable aaveV3FlashLoanAssetManagerLibAddress = Addresses.AAVE_V3_FLASH_LOAN_ASSET_MANAGER_LIB; // Replace with actual AaveV3FlashLoanAssetManagerLib address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the DispatcherOwnedBeaconFactory contract with the provided constructor values
        DispatcherOwnedBeaconFactory dispatcherOwnedBeaconFactory =
            new DispatcherOwnedBeaconFactory(dispatcherAddress, aaveV3FlashLoanAssetManagerLibAddress);

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(dispatcherOwnedBeaconFactory)); // Return the deployed contract address
    }
}
