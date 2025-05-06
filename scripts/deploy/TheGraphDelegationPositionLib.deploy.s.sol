// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import
    "./../../contracts/release/extensions/external-position-manager/external-positions/the-graph-delegation/TheGraphDelegationPositionLib.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployTheGraphDelegationPositionLib is Script {
    // Define constants for the constructor parameters
    // address public constant stakingProxyAddress = 0x00669A4CF01450B64E8A2A20E9b1FCB71E61eF03; // Provided Staking Proxy address
    // address public constant grtTokenAddress = 0x9623063377AD1B27544C965cCd7342f7EA7e88C7; // Provided GRT Token address

    //ethereum mainnet
    address public constant stakingProxyAddress = 0xF55041E37E12cD407ad00CE2910B8269B01263b9; // Provided Staking Proxy address
    address public constant grtTokenAddress = 0xc944E90C64B2c07662A292be6244BDf05Cda44a7; // Provided GRT Token address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the TheGraphDelegationPositionLib contract with the provided constructor values
        TheGraphDelegationPositionLib delegationPositionLib =
            new TheGraphDelegationPositionLib(stakingProxyAddress, grtTokenAddress);

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(delegationPositionLib)); // Return the deployed contract address
    }
}
