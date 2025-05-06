// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/release/extensions/fee-manager/fees/ExitRateBurnFee.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployExitRateBurnFee is Script {
    // Define a constant for the FeeManager address
    address public immutable feeManagerAddress = Addresses.FEE_MANAGER; // Replace with actual FeeManager address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the ExitRateBurnFee contract with the FeeManager address
        ExitRateBurnFee feeContract = new ExitRateBurnFee(feeManagerAddress);

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(feeContract)); // Return the deployed contract address
    }
}
