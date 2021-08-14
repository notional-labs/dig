#!/bin/bash
for filename in ~/dig/networks/testnet-2/gentx/*
do
    acc=$(cat $filename | jq '.body.messages[0] .delegator_address' | cut -d '"' -f 2)
    digd add-genesis-account $acc 150000000udig
done

