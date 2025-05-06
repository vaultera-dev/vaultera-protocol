// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import
    "./../../contracts/release/extensions/policy-manager/policies/current-shareholders/NoDepegOnRedeemSharesForSpecificAssetsPolicy.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployNoDepegOnRedeemSharesForSpecificAssetsPolicy is Script {
    address public immutable policyManagerAddress = Addresses.POLICY_MANAGER;
    address public immutable valueInterpreter = Addresses.VALUE_INTERPRETER;

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        NoDepegOnRedeemSharesForSpecificAssetsPolicy noDepegPolicy =
            new NoDepegOnRedeemSharesForSpecificAssetsPolicy(policyManagerAddress, IValueInterpreter(valueInterpreter));

        vm.stopBroadcast();

        return (address(noDepegPolicy));
    }
}
