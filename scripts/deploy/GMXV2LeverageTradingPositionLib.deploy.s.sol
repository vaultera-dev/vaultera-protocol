// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import
    "./../../contracts/release/extensions/external-position-manager/external-positions/gmx-v2-leverage-trading/GMXV2LeverageTradingPositionLib.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

//deploy-main
contract DeployGMXV2LeverageTradingPositionLib is Script {
    // Define constants for the constructor parameters
    address public constant wrappedNativeTokenAddress = 0x82aF49447D8a07e3bd95BD0d56f35241523fBab1; // Provided wrapped native token address
    address public constant dataStoreAddress = 0xFD70de6b91282D8017aA4E741e9Ae325CAb992d8; // Provided data store address
    address public constant chainlinkPriceFeedProviderAddress = 0x527FB0bCfF63C47761039bB386cFE181A92a4701; // Provided chainlink price feed provider address
    address public constant readerAddress = 0x5Ca84c34a381434786738735265b9f3FD814b824; // Provided reader address
    address public constant roleStoreAddress = 0x3c3d99FD298f679DBC2CEcd132b4eC4d0F5e6e72; // Provided role store address
    uint256 public constant callbackGasLimit = 750000; // Provided callback gas limit
    bytes32 public constant referralCode = bytes32(0); // Placeholder for referral code
    address public constant referralStorageAddress = 0xe6fab3F0c7199b0d34d7FbE83394fc0e0D06e99d; // Provided referral storage address
    address public constant uiFeeReceiverAddress = 0xaE87F9BD09895f1aA21c5023b61EcD85Eba515D1; // Placeholder for UI fee receiver address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the GMXV2LeverageTradingPositionLib contract with the provided constructor values
        GMXV2LeverageTradingPositionLib gmxv2LeverageTradingPositionLib = new GMXV2LeverageTradingPositionLib(
            IWETH(wrappedNativeTokenAddress),
            IGMXV2DataStore(dataStoreAddress),
            IGMXV2ChainlinkPriceFeedProvider(chainlinkPriceFeedProviderAddress),
            IGMXV2Reader(readerAddress),
            IGMXV2RoleStore(roleStoreAddress),
            callbackGasLimit,
            referralCode,
            referralStorageAddress,
            uiFeeReceiverAddress
        );

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(gmxv2LeverageTradingPositionLib)); // Return the deployed contract address
    }
}
