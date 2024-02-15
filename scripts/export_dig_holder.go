package main

import (
	"bufio"
	"encoding/csv"
	"encoding/json"
	"fmt"
	"os"
	"slices"
	"strconv"
	"strings"
)

var mapAddr = make(map[string]int)

const DigIbcDenom = "ibc/307E5C96C8F60D1CBEE269A9A86C0834E1DB06F2B3788AE4F716EDB97A48B97D"

// Function to read a large file and find the text "udig"
func findTextInLargeFile(filePath string, searchText string) bool {
	file, err := os.Open(filePath)
	if err != nil {
		fmt.Println("File not found.")
		return false
	}
	defer file.Close()

	const chunkSize = 1024 * 1024 * 10 // 10 MB chunk size, adjust as needed
	reader := bufio.NewReader(file)
	buffer := make([]byte, chunkSize)

	for {
		n, err := reader.Read(buffer)
		if err != nil && err.Error() != "EOF" {
			fmt.Println("Error reading file:", err)
			break
		}
		if n == 0 {
			break
		}
		chunk := string(buffer[:n])
		if strings.Contains(chunk, searchText) {
			tmps := strings.Split(chunk, "},{\"address")
			for _, tmp := range tmps {
				s := "{\"address" + tmp + "}"
				var result map[string]interface{}
				if err := json.Unmarshal([]byte(s), &result); err != nil {
					continue
				}
				coins, ok := result["coins"].([]interface{})
				if !ok {
					continue
				}
				balance := 0
				for _, coin := range coins {
					coinMap, ok := coin.(map[string]interface{})
					if !ok {
						continue
					}
					if coinMap["denom"] == DigIbcDenom {
						amountStr, ok := coinMap["amount"].(string)
						if !ok {
							fmt.Println("Amount is not a string")
							continue
						}
						amount, err := strconv.ParseFloat(amountStr, 64)
						if err != nil {
							fmt.Println("Error converting amount to float:", err)
							continue
						}
						balance = int(amount)
						break
					}
				}
				address, ok := result["address"].(string)
				if balance > 0 && ok && mapAddr[address] == 0 {
					mapAddr[address] = balance
				}
			}
		}
		if err != nil {
			break
		}
	}
	return true
}

func main() {

	// snapshot time -> 13-Feb-2024 12:40
	filePath := "/Users/hoank/export.json" // path of genesis file in your server
	searchText := "307E5C96C8F60D1CBEE269A9A86C0834E1DB06F2B3788AE4F716EDB97A48B97D"
	found := findTextInLargeFile(filePath, searchText)
	fmt.Printf("Text '%s' found: %t\n", searchText, found)

	module_address := []string{
		"osmo1szvslwsxf3y2s4lt3c7e7mm92zgy44j8krruht5zzanmhrjwyc4qqpt5nz", //pool #621 dig/osmo
		"osmo1rqamy6jc3f0rwrg5xz8hy8q7n932t2488f2gqg3d0cadvd3uqaxq4wazn8", // contract address
		"osmo18rqwcrvsfyy9s2tlfvmchclxf2cfw2hqvrjvkuljcrhq2vpg4suse8h6tj", // pool #620
		"osmo125dgaejga0q9wc6jcpf75lh6aeeyvrdz88xvzd",                     // ibc-accout
	}

	csvFilePath := "output.csv"
	file, err := os.Create(csvFilePath)
	if err != nil {
		fmt.Println("Error creating CSV file:", err)
		return
	}
	defer file.Close()

	writer := csv.NewWriter(file)
	defer writer.Flush()

	// Optionally write headers, if needed
	err = writer.Write([]string{"Address", "Balance"})
	if err != nil {
		return
	}
	totalBalance := 0
	for addr, balance := range mapAddr {
		totalBalance += balance
		if slices.Contains(module_address, addr) {
			continue
		}
		row := []string{addr, fmt.Sprint(balance)}
		err := writer.Write(row)
		if err != nil {
			return
		}
	}
	fmt.Println("total", len(mapAddr))
	fmt.Printf("Data written to %s\n", csvFilePath)
	fmt.Println("total balance", totalBalance)
}
