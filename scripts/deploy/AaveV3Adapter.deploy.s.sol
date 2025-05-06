// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/release/extensions/integration-manager/integrations/adapters/AaveV3Adapter.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployAaveV3Adapter is Script {
    // Define constants for the constructor parameters
    address public immutable integrationManagerAddress = Addresses.INTEGRATION_MANAGER; // Replace with actual IntegrationManager address
    address public immutable addressListRegistryAddress = Addresses.ADDRESS_LIST_REGISTRY; // Replace with actual AddressListRegistry address
    uint256 public constant aTokenListId = 8; // Provided aTokenListId
    address public constant aavePoolAddress = 0x794a61358D6845594F94dc1DB02A252b5b4814aD; // Provided Aave V3 Pool address
    uint16 public constant referralCode = 0; // Provided referralCode

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment
        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the AaveV3Adapter contract with the provided constructor values
        AaveV3Adapter aaveV3Adapter = new AaveV3Adapter(
            integrationManagerAddress, addressListRegistryAddress, aTokenListId, aavePoolAddress, referralCode
        );

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(aaveV3Adapter)); // Return the deployed contract address
    }
}
