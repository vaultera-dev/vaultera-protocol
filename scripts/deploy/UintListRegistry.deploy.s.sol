// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/persistent/uint-list-registry/UintListRegistry.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployUintListRegistry is Script {
    address public immutable dispatcher = Addresses.DISPATCHER;

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        UintListRegistry uintListRegistry = new UintListRegistry(dispatcher);

        vm.stopBroadcast();

        return (address(uintListRegistry));
    }
}
