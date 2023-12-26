// // Author: Adesoji Alu
// // Company: Enextgenwireless
// // Copyright 2023
// // Contact: adesoji@enextwireless.com , adesoji.alu@gmail.com


package main

import (
	"encoding/csv"
	"encoding/json"
	"fmt"
	"net/http"
	"os"
)

func main() {
	apiKey := "825fedddd36960b7c525070e76cc34970b4470dc"
	startDate := "2023-11-29T15:47:00"
	endDate := "2023-11-29T16:47:00"

	apiURL := fmt.Sprintf("http://localhost:3000/api/v1/mtn_lte/data?startDate=%s&endDate=%s&limit=10&offset=0&sort=asc", startDate, endDate)

	client := &http.Client{}
	req, err := http.NewRequest("GET", apiURL, nil)
	if err != nil {
		fmt.Println("Error creating request:", err)
		return
	}

	req.Header.Add("Authorization", "Bearer "+apiKey)

	resp, err := client.Do(req)
	if err != nil {
		fmt.Println("Error making request:", err)
		return
	}
	defer resp.Body.Close()

	if resp.StatusCode == http.StatusOK {
		var jsonData interface{}
		err := json.NewDecoder(resp.Body).Decode(&jsonData)
		if err != nil {
			fmt.Println("Error decoding JSON:", err)
			return
		}

		err = writeCSV(jsonData)
		if err != nil {
			fmt.Println("Error writing to CSV:", err)
			return
		}

		fmt.Println("Data exported to Enextgendata.csv 🕺😄")
	} else {
		fmt.Printf("Interprete Status Code . Please try again or check API key. Status code: %d\n", resp.StatusCode)
	}
}

func writeCSV(data interface{}) error {
    file, err := os.Create("Enextgendata.csv")
    if err != nil {
        return err
    }
    defer file.Close()

    writer := csv.NewWriter(file)
    defer writer.Flush()

    var headers []string // Declare headers

    switch array := data.(type) {
    case []interface{}:
        if len(array) > 0 {
            // Extract headers from the first record
            if firstRecord, ok := array[0].(map[string]interface{}); ok {
                for key := range firstRecord {
                    headers = append(headers, key)
                }
                writer.Write(headers) // Write headers
            }

            // Write data rows
            for _, record := range array {
                if obj, ok := record.(map[string]interface{}); ok {
                    var row []string
                    for _, header := range headers {
                        if value, exists := obj[header]; exists {
                            switch v := value.(type) {
                            case string:
                                row = append(row, v)
                            default:
                                row = append(row, fmt.Sprintf("%v", v))
                            }
                        } else {
                            row = append(row, "")
                        }
                    }
                    writer.Write(row)
                }
            }
        }
    default:
        return fmt.Errorf("unexpected JSON structure, expected top-level array")
    }

    return nil
}

