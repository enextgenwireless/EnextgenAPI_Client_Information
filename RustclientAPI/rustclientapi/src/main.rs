// Author: Adesoji Alu
// Company: Enextgenwireless
// Copyright 2023
// Contact: adesoji@enextwireless.com : adesoji.alu@gmail.com

// use reqwest::header;
// use std::fs;
// use csv::Writer;

// #[tokio::main]
// async fn main() -> Result<(), Box<dyn std::error::Error>> {
//     let api_key = "825fedddd36960b7c525070e76cc34970b4470dc"; // Replace with your actual API key
//     let start_date = "2023-11-29T15:47:00"; // Example start date
//     let end_date = "2023-11-29T16:47:00"; // Example end date

//     // Build the API URL with query parameters
//     let api_url = format!(
//         "http://localhost:3000/api/v1/mtn_lte/data?startDate={}&endDate={}&limit=10&offset=0&sort=asc",
//         start_date, end_date
//     );

//     let client = reqwest::Client::new();
//     let response = client
//         .get(&api_url)
//         .header(header::AUTHORIZATION, format!("Bearer {}", api_key))
//         .send()
//         .await?;

//     let json_data: serde_json::Value = response.json().await?;
//     let csv_data = serde_json::to_string(&json_data)?;

//     fs::write("Enextgendata.csv", csv_data)?;
//     println!("Data exported to Enextgendata.csv 🕺😄");

//     Ok(())
// }


use reqwest::header;
use serde_json::Value;
use csv::Writer;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let api_key = "xxxxxxxxxxxxxxxxxxxx"; // Replace with your actual API key
    let start_date = "2023-11-29T15:47:00"; // Example start date, Replace with your actual date
    let end_date = "2023-11-29T16:47:00"; // Example end date

    // Build the API URL with query parameters
    let api_url = format!(
        "http://localhost:3000/api/v1/mtn_lte/data?startDate={}&endDate={}&limit=10&offset=0&sort=asc",
        start_date, end_date
    );

    let client = reqwest::Client::new();
    let response = client
        .get(&api_url)
        .header(header::AUTHORIZATION, format!("Bearer {}", api_key))
        .send()
        .await?;

    if response.status().is_success() {
        let json_data: Value = response.json().await?;
        write_to_csv(json_data)?;
        println!("Data exported to Enextgendata.csv 🕺😄");
    } else {
        println!(
            "Error fetching data, Please Try again in some hours or PAY 💵 to get the API 🔑 😠: {:?}",
            response.status()
        );
    }

    Ok(())
}

fn write_to_csv(data: Value) -> Result<(), Box<dyn std::error::Error>> {
    let mut wtr = Writer::from_path("Enextgendata.csv")?;

    if let Some(array) = data.as_array() {
        for record in array {
            if let Some(obj) = record.as_object() {
                let mut row = Vec::new();
                for (_, value) in obj {
                    // Assuming all values are strings; modify as needed based on your data
                    if let Some(s) = value.as_str() {
                        row.push(s);
                    } else {
                        row.push(""); // or handle non-string values accordingly
                    }
                }
                wtr.write_record(&row)?;
            }
        }
    }

    wtr.flush()?;
    Ok(())
}



