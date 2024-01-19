// Author: Adesoji Alu
// Company: Enextgenwireless
// Copyright 2023
// Contact: adesoji@enextwireless.com  , adesoji.alu@gmail.com 


//with limit and sort option

const axios = require('axios');
const fs = require('fs');
const Papa = require('papaparse');

// Hardcoded API key
const apiKey = '7d91cd716d2ed25c24d909e61116506534a421f0'; // Replace with your actual API key

// Function to fetch data
const fetchData = async () => {
  try {
    const startDate = '2023-11-29T15:47:00'; // Example start date
    const endDate = '2023-11-29T16:47:00'; // Example end date
    const sort = 'desc'; // Sorting order, can be 'asc' or 'desc'
    const limit = 10; // Number of records to return
    const offset = 0; // Number of records to skip

    // Construct the API URL with query parameters
    const apiUrl = `https://api.enextwireless.com/api/api/v1/mtn_lte/data?startDate=${startDate}&endDate=${endDate}&sort=${sort}&limit=${limit}&offset=${offset}`;

    const response = await axios.get(apiUrl, {
      headers: { Authorization: `Bearer ${apiKey}` }
    });

    // Convert the JSON data to CSV
    const csv = Papa.unparse(response.data);

    // Write the CSV data to a file
    fs.writeFileSync('Enextgendata.csv', csv);

    console.log('Data exported to Enextgendata.csv 🕺😄');
  } catch (error) {
    console.error('Error fetching data, or PAY 💵 to get the API 🔑 😠 :', error.response?.data || error.message);
  }
};

fetchData();


//without sort and limit option

// const axios = require('axios');
// const fs = require('fs');
// const Papa = require('papaparse');

// // Hardcoded API key
// const apiKey = '7d91cd716d2ed25c24d909e61116506534a421f0'; // Replace with your actual API key

// // Function to fetch data
// const fetchData = async () => {
//   try {
//     const startDate = '2023-11-29T15:47:00'; // Example start date
//     const endDate = '2023-11-29T16:47:00'; // Example end date
//     const apiUrl = `https://api.enextwireless.com/api/api/v1/mtn_lte/data?startDate=${startDate}&endDate=${endDate}`;
//     //const apiUrl = `https://api.enextwireless.com/api/api/v1/nine_mobile_lte/data?startDate=${startDate}&endDate=${endDate}`;

//     const response = await axios.get(apiUrl, {
//       headers: { Authorization: `Bearer ${apiKey}` }
//     });

//     // Convert the JSON data to CSV
//     const csv = Papa.unparse(response.data);

//     // Write the CSV data to a file
//     fs.writeFileSync('Enextgendata.csv', csv);

//     console.log('Data exported to Enextgendata.csv 🕺😄');
//   } catch (error) {
//     console.error('Error fetching data,or PAY 💵 to get the API 🔑 😠 :', error.response?.data || error.message);
//   }
// };

// fetchData();