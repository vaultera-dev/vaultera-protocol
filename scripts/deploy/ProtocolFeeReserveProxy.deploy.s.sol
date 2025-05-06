// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/persistent/protocol-fee-reserve/ProtocolFeeReserveProxy.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployProtocolFeeReserveProxy is Script {
    address public immutable protocolFeeReserveLib = Addresses.PROTOCOL_FEE_RESERVE_LIB;
    //change this value
    bytes public constructData = Addresses.PROTOCOL_FEE_RESERVE_PROXY_CONSTRUCTOR_DATA;

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        // Deploy the ProtocolFeeReserveProxy contract
        ProtocolFeeReserveProxy proxy = new ProtocolFeeReserveProxy(constructData, protocolFeeReserveLib);

        vm.stopBroadcast();

        console.log("Deployed ProtocolFeeReserveProxy at:", address(proxy));

        return address(proxy);
    }
}
