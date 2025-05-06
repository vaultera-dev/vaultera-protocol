// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import
    "./../../contracts/release/extensions/external-position-manager/external-positions/aave-v3-debt/AaveV3DebtPositionParser.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployAaveV3DebtPositionParser is Script {
    // Define constants for the constructor parameters
    address public immutable addressListRegistryAddress = Addresses.ADDRESS_LIST_REGISTRY; // Replace with actual AddressListRegistry address
    uint256 public constant aTokenListId = 8; // Provided value

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment
        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the AaveV3DebtPositionParser contract with the provided constructor values
        AaveV3DebtPositionParser debtPositionParser =
            new AaveV3DebtPositionParser(addressListRegistryAddress, aTokenListId);

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(debtPositionParser)); // Return the deployed contract address
    }
}
