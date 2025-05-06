// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import
    "./../../contracts/release/extensions/external-position-manager/external-positions/gmx-v2-leverage-trading/GMXV2LeverageTradingPositionParser.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployGMXV2LeverageTradingPositionParser is Script {
    // Define constants for the constructor parameters
    address public constant wrappedNativeTokenAddress = 0x82aF49447D8a07e3bd95BD0d56f35241523fBab1; // Provided Wrapped Native Token address
    address public constant dataStoreAddress = 0xFD70de6b91282D8017aA4E741e9Ae325CAb992d8; // Provided Data Store address
    address public constant readerAddress = 0x5Ca84c34a381434786738735265b9f3FD814b824; // Provided GMX V2 Reader address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the GMXV2LeverageTradingPositionParser contract with the provided constructor values
        GMXV2LeverageTradingPositionParser positionParser = new GMXV2LeverageTradingPositionParser(
            wrappedNativeTokenAddress, dataStoreAddress, IGMXV2Reader(readerAddress)
        );

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(positionParser)); // Return the deployed contract address
    }
}
