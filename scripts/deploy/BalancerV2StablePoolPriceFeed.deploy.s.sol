// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/release/infrastructure/price-feeds/derivatives/feeds/BalancerV2StablePoolPriceFeed.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployBalancerV2StablePoolPriceFeed is Script {
    //arbitrum
    // address public immutable fundDeployer = Addresses.FUND_DEPLOYER;
    // address public constant balancerVault = 0xBA12222222228d8Ba445958a75a0704d566BF2C8;
    // address[] public poolFactories;

    //ethereum
    address public immutable fundDeployer = Addresses.FUND_DEPLOYER;
    address public constant balancerVault = 0xBA12222222228d8Ba445958a75a0704d566BF2C8;
    address[] public poolFactories = [0x67d27634E44793fE63c467035E31ea8635117cd4, 0xdba127fBc23fb20F5929C546af220A991b5C6e01];

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        BalancerV2StablePoolPriceFeed balancerV2StablePoolPriceFeed =
            new BalancerV2StablePoolPriceFeed(fundDeployer, balancerVault, poolFactories);

        vm.stopBroadcast();

        return (address(balancerV2StablePoolPriceFeed));
    }
}
