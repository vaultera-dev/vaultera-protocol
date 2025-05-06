// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/release/infrastructure/value-interpreter/ValueInterpreter.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployValueInterpreter is Script {
    //arbitrum
    // address public immutable fundDeployer = Addresses.FUND_DEPLOYER;
    // address public constant wethToken = 0x82aF49447D8a07e3bd95BD0d56f35241523fBab1;
    // uint256 public constant chainlinkStaleRateThreshold = 90000;

    //ethereum
    address public immutable fundDeployer = Addresses.FUND_DEPLOYER;
    address public constant wethToken = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    uint256 public constant chainlinkStaleRateThreshold = 90000;

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        ValueInterpreter valueInterpreter = new ValueInterpreter(fundDeployer, wethToken, chainlinkStaleRateThreshold);

        vm.stopBroadcast();

        return (address(valueInterpreter));
    }
}
