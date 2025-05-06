// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

import "forge-std/Script.sol";
import
    "./../../contracts/release/extensions/external-position-manager/external-positions/uniswap-v3-liquidity/UniswapV3LiquidityPositionParser.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployUniswapV3LiquidityPositionParser is Script {
    // Define constants for the constructor parameters
    address public immutable valueInterpreterAddress = Addresses.VALUE_INTERPRETER; // Replace with actual ValueInterpreter address
    address public constant nonfungiblePositionManagerAddress = 0xC36442b4a4522E871399CD717aBDD847Ab11FE88; // Provided Nonfungible Position Manager address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the UniswapV3LiquidityPositionParser contract with the provided constructor values
        UniswapV3LiquidityPositionParser positionParser =
            new UniswapV3LiquidityPositionParser(valueInterpreterAddress, nonfungiblePositionManagerAddress);

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(positionParser)); // Return the deployed contract address
    }
}
