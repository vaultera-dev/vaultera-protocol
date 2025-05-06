// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import "./../../contracts/release/peripheral/DepositWrapper.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployDepositWrapper is Script {
    // Define constants for the constructor parameters
    address public immutable addressListRegistryAddress = Addresses.ADDRESS_LIST_REGISTRY; // Replace with actual AddressListRegistry address
    uint256 public constant allowedExchangesListId = 553; // Provided allowed exchanges list ID
    address public constant wrappedNativeAssetAddress = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2; // Provided wrapped native asset address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the DepositWrapper contract with the provided constructor values
        DepositWrapper depositWrapper =
            new DepositWrapper(addressListRegistryAddress, allowedExchangesListId, IWETH(wrappedNativeAssetAddress));

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(depositWrapper)); // Return the deployed contract address
    }
}
