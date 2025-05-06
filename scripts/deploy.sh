#!/bin/bash

# Define the available network options
networks=("amoy" "arbitrum" "mainnet")

# Define the available contract options
contracts=("Dispatcher" "UintListRegistry" "AddressListRegistry" "ExternalPositionFactory" "GasRelayPaymasterLib" "GasRelayPaymasterFactory" "FundDeployer" "FeeManager" "PolicyManager" "ValueInterpreter" "IntegrationManager" "ExternalPositionManager" "ProtocolFeeTracker" "GlobalConfigLib" "GlobalConfigProxy" "FundValueCalculator" "FundValueCalculatorRouter" "AaveV3ATokenListOwner" "UnpermissionedActionsWrapper" "BalancerV2GaugeTokenPriceFeed" "BalancerV2StablePoolPriceFeed" "AaveV3FlashLoanAssetManagerLib" "ProtocolFeeReserveLib" "ProtocolFeeReserveProxy" "VaultLib" "EntranceRateBurnFee" "ExitRateDirectFee" "AllowedExternalPositionTypesPolicy" "NoDepegOnRedeemSharesForSpecificAssetsPolicy" "MinSharesSupplyFee" "AllowedAdaptersPolicy" "EntranceRateDirectFee" "AllowedAdapterIncomingAssetsPolicy" "ManagementFee" "AllowedAdaptersPerManagerPolicy" "AllowedAssetsForRedemptionPolicy" "MinMaxInvestmentPolicy" "ExitRateBurnFee" "PerformanceFee" "AllowedSharesTransferRecipientsPolicy" "AllowedDepositRecipientsPolicy" "AllowedExternalPositionTypesPerManagerPolicy" "DisallowedAdapterIncomingAssetsPolicy" "MinAssetBalancesPostRedemptionPolicy" "AllowedRedeemersForSpecificAssetsPolicy" "OnlyUntrackDustOrPricelessAssetsPolicy" "CumulativeSlippageTolerancePolicy" "OnlyRemoveDustExternalPositionPolicy" "UniswapV3LiquidityPositionLib" "OneInchV5Adapter" "AaveV3DebtPositionParser" "BalancerV2LiquidityAdapter" "UniswapV3LiquidityPositionParser" "UniswapV3Adapter" "AaveV3DebtPositionLib" "ParaSwapV5Adapter" "GMXV2LeverageTradingPositionParser" "ManualValueOracleLib" "ManualValueOracleFactory" "TheGraphDelegationPositionParser" "TheGraphDelegationPositionLib" "TransferAssetsAdapter" "DispatcherOwnedBeaconFactory" "DepositWrapper" "GMXV2LeverageTradingPositionLib" "ComptrollerLib" "BalancerV2WeightedPoolPriceFeed" "AaveV3Adapter")


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

# Function to ask the user a yes/no question
ask() {
    prompt="$1"
    default="$2"

    while true; do
        read -p "$prompt [$default]: " response
        if [[ -z "$response" ]]; then
            response="$default"
        fi
        case "$response" in
            [Yy]* ) echo "yes"; return;;
            [Nn]* ) echo "no"; return;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

# Ask user for network
echo "Choose network to deploy:"
for i in "${!networks[@]}"; do
    printf "%d) %s\n" "$((i+1))" "${networks[$i]}"
done
read -p "Enter your choice: " network_choice
network="${networks[$((network_choice-1))]}"

# Ask user if they want to verify
verify=$(ask "Do you want to verify contract?" "yes/no")

# Determine the --verify flag based on user input
if [[ "$verify" == "yes" ]]; then
    verify_flag="--verify"
else
    verify_flag=""
fi

# Ask user which contract to deploy
echo "Choose contrat to deploy:"
for i in "${!contracts[@]}"; do
    printf "%d) %s\n" "$((i+1))" "${contracts[$i]}"
done
read -p "Enter your choice: " contract_choice
contract_choice=$((contract_choice-1))
contract="${contracts[$contract_choice]}"

# Construct the full script path
script_path="scripts/deploy/$contract.deploy.s.sol:Deploy$contract"

forge clean
# Construct and run the forge command
# forge script "$script_path" --rpc-url "$network" --broadcast --priority-gas-price 10000000000 --with-gas-price 15000000000 --gas-limit 8000000 -vvvv $verify_flag 
forge script --chain "$network" "$script_path" --rpc-url "$network" --broadcast -vvvv $verify_flag
# forge script  script/deploy/Dispatcher.deploy.s.sol:DeployDispatcher --rpc-url https://polygon-amoy.g.alchemy.com/v2/jJUgGjQsD7SiypxAWKDb9zJA99jsOeeZ --broadcast 

