// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/persistent/global-config/GlobalConfigProxy.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployGlobalConfigProxy is Script {
    address public immutable globalConfigLib = Addresses.GLOBAL_CONFIG_LIB;
    bytes public constructData = Addresses.GLOBAL_CONFIG_PROXY_CONSTRUCTOR_DATA;

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        GlobalConfigProxy globalConfigProxy = new GlobalConfigProxy(constructData, globalConfigLib);

        vm.stopBroadcast();

        return (address(globalConfigProxy));
    }
}
