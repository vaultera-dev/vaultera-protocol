// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

import "forge-std/Script.sol";
import
    "./../../contracts/release/extensions/external-position-manager/external-positions/uniswap-v3-liquidity/UniswapV3LiquidityPositionLib.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployUniswapV3LiquidityPositionLib is Script {
    // Define constants for the constructor parameters
    // address public constant nonFungibleTokenManagerAddress = 0xC36442b4a4522E871399CD717aBDD847Ab11FE88; // Provided nonFungibleTokenManager address
    address public immutable valueInterpreterAddress = Addresses.VALUE_INTERPRETER; // Replace with actual ValueInterpreter address


    //ethereum mainnet
    address public constant nonFungibleTokenManagerAddress = 0xC36442b4a4522E871399CD717aBDD847Ab11FE88; // Provided nonFungibleTokenManager address
    // address public immutable valueInterpreterAddress = 0x369373dE3A389047aD7e7846470Eb8324fc3Fe8E; // Replace with actual ValueInterpreter address


    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the UniswapV3LiquidityPositionLib contract with the provided constructor values
        UniswapV3LiquidityPositionLib liquidityPositionLib =
            new UniswapV3LiquidityPositionLib(nonFungibleTokenManagerAddress, valueInterpreterAddress);

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(liquidityPositionLib)); // Return the deployed contract address
    }
}
