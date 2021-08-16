#!/bin/bash
for filename in ~/.dig/config/gentx/*
do
    acc=$(cat $filename | jq '.body.messages[0] .delegator_address' | cut -d '"' -f 2)
    digd add-genesis-account $acc 100000000udig
done

