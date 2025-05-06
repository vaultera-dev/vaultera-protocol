// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/persistent/off-chain/fund-value-calculator/FundValueCalculatorRouter.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployFundValueCalculatorRouter is Script {
    address public immutable dispatcher = Addresses.DISPATCHER;
    address[] public fundDeployers = [Addresses.FUND_DEPLOYER];
    address[] public fundValueCalculators = [Addresses.FUND_VALUE_CALCULATOR];

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        FundValueCalculatorRouter fundValueCalculatorRouter =
            new FundValueCalculatorRouter(dispatcher, fundDeployers, fundValueCalculators);

        vm.stopBroadcast();

        return (address(fundValueCalculatorRouter));
    }
}
