#!/bin/bash

# ANSI format
GREEN='\e[32m'
COLOR_RESET='\033[0m'


echo -e "${GREEN}\n=> [ETH] Setting Starknet Escrow Address on ETH Smart Contract${COLOR_RESET}"

if [ -f ./contracts/solidity/.env ]; then
    echo "Sourcing solidity/.env file..."
    source ./contracts/solidity/.env
else
    echo "Error: solidity/.env file not found!"
    exit 1
fi
if [ -f ./contracts/cairo/.env ]; then
    echo "Sourcing cairo/.env file..."
    source ./contracts/cairo/.env
else
    echo "Error: cairo/.env file not found!"
    exit 1
fi

echo "Smart contract being modified:" $ETH_CONTRACT_ADDR
echo "New Escrow address:" $ESCROW_CONTRACT_ADDRESS

cast send --rpc-url $ETH_RPC_URL --private-key $ETH_PRIVATE_KEY $ETH_CONTRACT_ADDR "setEscrowAddress(uint256)" $ESCROW_CONTRACT_ADDRESS
