#!/bin/bash

# Define the available network options
networks=("amoy" "arbitrum" "mainnet")

# Define the available contract options
contracts=("Dispatcher" "UintListRegistry" "AddressListRegistry" "ExternalPositionFactory" "GasRelayPaymasterLib" "GasRelayPaymasterFactory" "FundDeployer" "FeeManager" "PolicyManager" "ValueInterpreter" "IntegrationManager" "ExternalPositionManager" "ProtocolFeeTracker" "GlobalConfigLib" "GlobalConfigProxy" "FundValueCalculator" "FundValueCalculatorRouter" "AaveV3ATokenListOwner" "UnpermissionedActionsWrapper" "BalancerV2GaugeTokenPriceFeed" "BalancerV2StablePoolPriceFeed" "AaveV3FlashLoanAssetManagerLib" "ProtocolFeeReserveLib" "ProtocolFeeReserveProxy" "VaultLib" "EntranceRateBurnFee" "ExitRateDirectFee" "AllowedExternalPositionTypesPolicy" "NoDepegOnRedeemSharesForSpecificAssetsPolicy" "MinSharesSupplyFee" "AllowedAdaptersPolicy" "EntranceRateDirectFee" "AllowedAdapterIncomingAssetsPolicy" "ManagementFee" "AllowedAdaptersPerManagerPolicy" "AllowedAssetsForRedemptionPolicy" "MinMaxInvestmentPolicy" "ExitRateBurnFee" "PerformanceFee" "AllowedSharesTransferRecipientsPolicy" "AllowedDepositRecipientsPolicy" "AllowedExternalPositionTypesPerManagerPolicy" "DisallowedAdapterIncomingAssetsPolicy" "MinAssetBalancesPostRedemptionPolicy" "AllowedRedeemersForSpecificAssetsPolicy" "OnlyUntrackDustOrPricelessAssetsPolicy" "CumulativeSlippageTolerancePolicy" "OnlyRemoveDustExternalPositionPolicy" "UniswapV3LiquidityPositionLib" "OneInchV5Adapter" "AaveV3DebtPositionParser" "BalancerV2LiquidityAdapter" "UniswapV3LiquidityPositionParser" "UniswapV3Adapter" "AaveV3DebtPositionLib" "ParaSwapV5Adapter" "GMXV2LeverageTradingPositionParser" "ManualValueOracleLib" "ManualValueOracleFactory" "TheGraphDelegationPositionParser" "TheGraphDelegationPositionLib" "TransferAssetsAdapter" "DispatcherOwnedBeaconFactory" "DepositWrapper" "GMXV2LeverageTradingPositionLib" "ComptrollerLib" "BalancerV2WeightedPoolPriceFeed" "AaveV3Adapter" "ParaSwapV6Adapter")

# Function to prompt the user to choose an option from a list
choose() {
    prompt="$1"
    options=("${@:2}")

    printf "\n%s\n" "$prompt"
    for i in "${!options[@]}"; do
        printf "%d) %s\n" "$((i+1))" "${options[$i]}"
    done

    while true; do
        read -p "Enter your choice: " choice
        if [[ "$choice" -ge 1 && "$choice" -le "${#options[@]}" ]]; then
            echo "${options[$((choice-1))]}"
            return
        fi
        echo "Invalid choice, please try again."
    done
}

# Ask user which contract to deploy
echo "Choose contract to deploy:"
for i in "${!contracts[@]}"; do
    printf "%d) %s\n" "$((i+1))" "${contracts[$i]}"
done
read -p "Enter your choice: " contract_choice
contract_choice=$((contract_choice-1))
contract="${contracts[$contract_choice]}"

# Construct the full script path
script_path="scripts/deploy/$contract.deploy.s.sol:Deploy$contract"

forge clean
# Deploy to mainnet without verification
forge script --chain "mainnet" "$script_path" --rpc-url "mainnet" --broadcast -vvvv