// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/persistent/address-list-registry/AddressListRegistry.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployAddressListRegistry is Script {
    address public immutable dispatcher = Addresses.DISPATCHER;

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        AddressListRegistry addressListRegistry = new AddressListRegistry(dispatcher);

        vm.stopBroadcast();

        return (address(addressListRegistry));
    }
}
