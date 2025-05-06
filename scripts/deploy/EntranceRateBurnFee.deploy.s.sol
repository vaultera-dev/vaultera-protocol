// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/release/extensions/fee-manager/fees/EntranceRateBurnFee.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployEntranceRateBurnFee is Script {
    address public immutable feeManager = Addresses.FEE_MANAGER; // provided address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        EntranceRateBurnFee entranceRateBurnFee = new EntranceRateBurnFee(feeManager);

        vm.stopBroadcast();

        return (address(entranceRateBurnFee));
    }
}
