// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import
    "./../../contracts/release/extensions/external-position-manager/external-positions/aave-v3-debt/AaveV3DebtPositionLib.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployAaveV3DebtPositionLib is Script {
    // Define constants for the constructor parameters
    //arbitrum mainnet
    // address public constant dataProviderAddress = 0x69FA688f1Dc47d4B5d8029D5a35FB7a548310654; // Provided Data Provider address
    // address public constant lendingPoolAddressProviderAddress = 0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb; // Provided Lending Pool Address Provider address
    // uint16 public constant referralCode = 0; // Provided referral code
    // address public constant rewardsControllerAddress = 0x929EC64c34a17401F460460D4B9390518E5B473e; // Provided Rewards Controller address

    //ethereum mainnet
//     Vault Address: 0x7b4eb56e7cd4b454ba8ff71e4518426369a138a3
// Controller Address: 0x2f39d218133AFaB8F2B819B1066c7E434Ad94E9e
// Flag Parameter: A uint16 value (appears to be 0)
// Additional Address: 0x8164cc65827dcfe994ab23944cbc90e0aa80bfcb


    address public constant dataProviderAddress = 0x7B4EB56E7CD4b454BA8ff71E4518426369a138a3; // Provided Data Provider address
    address public constant lendingPoolAddressProviderAddress = 0x2f39d218133AFaB8F2B819B1066c7E434Ad94E9e; // Provided Lending Pool Address Provider address
    uint16 public constant referralCode = 0; // Provided referral code
    address public constant rewardsControllerAddress = 0x8164Cc65827dcFe994AB23944CBC90e0aa80bFcb; // Provided Rewards Controller address


    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the AaveV3DebtPositionLib contract with the provided constructor values
        AaveV3DebtPositionLib debtPositionLib = new AaveV3DebtPositionLib(
            IAaveV3ProtocolDataProvider(dataProviderAddress),
            IAaveV3PoolAddressProvider(lendingPoolAddressProviderAddress),
            referralCode,
            IAaveV3RewardsController(rewardsControllerAddress)
        );

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(debtPositionLib)); // Return the deployed contract address
    }
}
