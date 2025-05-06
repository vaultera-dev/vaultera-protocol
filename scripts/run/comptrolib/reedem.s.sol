// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// Import required Forge standard libraries
import "forge-std/Script.sol";
import "forge-std/console.sol";

// Import Comptroller interface from the Enzyme protocol
import "./../../../contracts/release/core/fund/comptroller/IComptroller.sol";

/// @notice Script to redeem fund shares for specific assets
contract redeemSharesForSpecificAssets is Script {
    // Address of the fund's comptroller proxy
    address public constant comptrollerProxyAddress = 0xFe6EE62c13dF8D8aeaeEC6BE48Cbc48E6c04290f;

    // Address that will receive the redeemed assets
    address public constant recipient = 0xaE87F9BD09895f1aA21c5023b61EcD85Eba515D1;

    // Amount of shares to redeem
    // uint256 public sharesQuantity = type(uint256).max;
    uint256 public sharesQuantity = 10;

    // Assets to receive upon redemption (WETH address)
    address[] public payoutAssets = [0x82aF49447D8a07e3bd95BD0d56f35241523fBab1]; 

    // Percentage distribution of assets (100% = 10000)
    uint256[] public payoutAssetPercentages = [10000];

    function run() external {
        // Get private key from environment
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // Start transaction broadcast
        vm.startBroadcast(deployerPrivateKey);

        // Initialize comptroller interface
        IComptroller comptrollerProxy = IComptroller(comptrollerProxyAddress);

        // Get and log the denomination asset
        address res = comptrollerProxy.getDenominationAsset();
        console.log("res   ", res);

        // Execute share redemption
        comptrollerProxy.redeemSharesForSpecificAssets(
            recipient, 
            sharesQuantity, 
            payoutAssets, 
            payoutAssetPercentages
        );

        // End transaction broadcast
        vm.stopBroadcast();
    }
}