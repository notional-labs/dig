## Step 1: Export the Current Osmosis Genesis File
To export the current osmosis genesis file, run the following command in your terminal:

    osmosisd export > export.json

This command will save the current osmosis genesis file to `export.json`.

## Step 2: Export DIG Holder Addresses
To start exporting DIG holder addresses, execute the following command:

    go run export_dig_holder.go
This script will collect and output the DIG holder addresses to `output.csv`.