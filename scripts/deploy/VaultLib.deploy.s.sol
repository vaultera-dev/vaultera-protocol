// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/release/core/fund/vault/VaultLib.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployVaultLib is Script {
    //arbitrum
    // address public immutable externalPositionManager = Addresses.EXTERNAL_POSITION_MANAGER;
    // address public immutable gasRelayPaymasterFactory = Addresses.GAS_RELAY_PAYMASTER_FACTORY;
    // address public immutable protocolFeeReserve = Addresses.PROTOCOL_FEE_RESERVE_PROXY; //protocolFeeReserve
    // address public immutable protocolFeeTracker = Addresses.PROTOCOL_FEE_TRACKER;
    // address public constant mlnToken = 0xaf421A0A3c72E4C7C162463D0Ad1C92f33419428;
    // address public immutable mlnBurner = Addresses.PROTOCOL_FEE_RESERVE_PROXY; // protocolFeeReserve
    // address public constant wethToken = 0x82aF49447D8a07e3bd95BD0d56f35241523fBab1;
    // uint256 public constant positionsLimit = 20;


    //ethereum
    address public immutable externalPositionManager = Addresses.EXTERNAL_POSITION_MANAGER;
    address public immutable gasRelayPaymasterFactory = Addresses.GAS_RELAY_PAYMASTER_FACTORY;
    address public immutable protocolFeeReserve = Addresses.PROTOCOL_FEE_RESERVE_PROXY; //protocolFeeReserve
    address public immutable protocolFeeTracker = Addresses.PROTOCOL_FEE_TRACKER;
    address public constant mlnToken = 0xec67005c4E498Ec7f55E092bd1d35cbC47C91892;
    address public immutable mlnBurner = Addresses.PROTOCOL_FEE_RESERVE_PROXY; // protocolFeeReserve // is addresszero
    address public constant wethToken = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    uint256 public constant positionsLimit = 20;


    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        VaultLib vaultLib = new VaultLib(
            externalPositionManager,
            gasRelayPaymasterFactory,
            protocolFeeReserve,
            protocolFeeTracker,
            mlnToken,
            mlnBurner,
            wethToken,
            positionsLimit
        );

        vm.stopBroadcast();

        return (address(vaultLib));
    }
}
