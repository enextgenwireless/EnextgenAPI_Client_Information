# Instructions  and  installation Support for using EnextAPI

## Javascript 🌐👨‍💻🚀

Install the javascript packages in your environment below 👇

```bash
npm install papaparse
```

```bash
npm install axios
```

to run the client script, run 👇

```bash
node fetchData.js 
```

## Python  🐍👨‍💻🐍🔍

Install the packages below in your environment or terminal , run 👇

```bash
pip install csv
pip install requests
pip install pandas
```

or in jupyter notebook environment, run 👇

```bash
!pip install csv
!pip install requests
!pip install pandas
```

to run the Api script, run 👇

```bash
python or python3  fetchData.py
```

## Golang

![Alt text](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCk3KL9GqsfOi22-Q_SJ8W0cm9Wyqxzn4HNQ)

Navigate to this [path](GolangclientAPI/fetchData.go) and run the command below in your terminal , run 👇

```bash
go run fetchData.go
```

## Ruby 💎👨‍💻🔮

![Alt text](https://th.bing.com/th/id/OIP.UPHsSJ6hddHrEDEElh_XzAHaFj?rs=1&pid=ImgDetMain)

Navigate [here](RubyclientAPI/fetchData.rb) and run 👇 in your terminal

```bash
ruby fetchData.rb
```

This will output a csv data called Enextgendata.csv

## Rust

![Alt text](https://th.bing.com/th/id/R.6263df62840add6bc6123157bac295f5?rik=kqtt2PAY49wR4A&pid=ImgRaw&r=0)


Navigate to this [path](RustclientAPI/rustclientapi/src/main.rs) and  run 👇

```bash
cargo run
```

This will output a csv data called Enextgendata.csv in an array format.

## : Note

Only 4G or lte was used as examples in the existing scripts, other network technologies like 2g,3g and 5G needs the modification of the apiUrl = `http://localhost:3000/api/v1/mtn_lte/data?startDate=${startDate}&endDate=${endDate}&sort=${sort}&limit=${limit}&offset=${offset}`; by replacing `mtn_lte` `to mtn_3g` or `airtel_3g` based on your option, but the scripts for that be provided in subsequent version , refer to the API documentation  👉 [here]()

To create a new Rust application in your Ubuntu terminal, you can use the following steps:

1. **Install Rust:**
   Make sure you have Rust installed on your system. If you haven't installed it yet, you can do so by using the following command in your terminal:

   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```

   Follow the on-screen instructions to complete the installation.

2. **Restart Your Terminal:**
   After installing Rust, it's a good idea to restart your terminal or run the following command to apply the changes to your environment:

   ```bash
   source $HOME/.cargo/env
   ```

3. **Create a New Rust Project:**
   Use the `cargo` tool, which comes with Rust, to create a new project. Open your terminal and run:

   ```bash
   cargo new your_project_name
   ```

   Replace `your_project_name` with the desired name for your Rust project.

   for example, run  cargo new Enextapi

   you get the output below

   Created binary (application) `Enextapi` package

4. **Navigate to the Project Directory:**
   Change into the project directory using the `cd` command:

   ```bash
   cd your_project_name
   ```

5. **Build and Run the Project:**
   Build and run the project with:

   ```bash
   cargo build
   ```

   And then:

   ```bash
   cargo run
   ```

   The first command (`cargo build`) will compile your Rust project, and the second (`cargo run`) will execute it.

Now you have a new Rust project set up on your system. You can start editing the code in the `src` directory of your project. The main Rust file is usually located at `src/main.rs`.

First, add the following dependencies to your Cargo.toml file:

```bash
toml
[dependencies]
reqwest = { version = "1.0", features = ["json"] }
csv = "1.0"
```

To run the script, install the reqwest, serde_json, and csv crates using cargo install:

```sh
cargo install reqwest serde_json csv
```

Then, compile and run the script:

```sh
cargo run
```

This will create a data.csv file with the fetched data.

Authentication
You do  need to authenticate in order to explore the ENEXTGENWIRELESS data. However, if you will be intensively using the APIs to, say, support any application, then you should sign up for an [ENEXTAPI developer key](https://www.api.enextwireless.com/signup)

Web Service Rate Limits

Limits are placed on the number of API requests you may make using your API key. Rate limits may vary by service, but the defaults are:

- Daily Limit: 1,000 requests per day

For each API key, these limits are applied across all api.enextwireless.com API requests. Exceeding these limits will lead to your API key being temporarily blocked from making further requests. The block will automatically be lifted by waiting an hour. If you need higher rate limits, contact us.

DEMO_KEY Rate Limits
In documentation examples, the special DEMO_KEY api key is used. This API key can be used for initially exploring APIs prior to signing up, but it has much lower rate limits, so you’re encouraged to signup for your own API key if you plan to use the API (signup is quick and easy). The rate limits for the DEMO_KEY are:

Hourly Limit: 30 requests per IP address per hour
Daily Limit: 50 requests per IP address per day
How Do I See My Current Usage?
Your can check your current rate limit and usage details by inspecting the X-RateLimit-Limit and X-RateLimit-Remaining HTTP headers that are returned on every API response. For example, if an API has the default hourly limit of 1,000 request, after making 2 requests, you will receive this HTTP header in the response of the second request:

X-RateLimit-Remaining: 998

curl -I -H "Authorization: Bearer 5c2d3c1dfd6d2f46ab8f6a03a53868269aac3792" <http://localhost:3000/api/mtn_lte/data>

![alt-text](public/Screenshot-from-2023-12-03-00-28-24.png)

The hourly counters for your API key reset on a rolling basis.

Example: If you made 500 requests at 10:15AM and 500 requests at 10:25AM, your API key would become temporarily blocked. This temporary block of your API key would cease at 11:15AM, at which point you could make 500 requests. At 11:25AM, you could then make another 500 requests.

Anyone can register for an api.nasa.gov key, which can be used to access data across federal agencies.
API Key Recovery
Please contact us for help recovering an old API keyInfo I Icon

 curl -H "Authorization: Bearer 7d91cd716d2ed25c24d909e61116506534a421f0" "<http://localhost:3000/api/v1/mtn_lte/data?startDate=2023-11-29T15:47:00&endDate=2023-11-29T16:47:00>" -o Enextgendata.csv
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 1578k  100 1578k    0     0  55045      0  0:00:29  0:00:29 --:--:--  380k

```bash
curl -H "Authorization: Bearer 7d91cd716d2ed25c24d909e61116506534a421f0" "http://localhost:3000/api/v1/mtn_lte/data?startDate=2023-11-29T15:47:00&endDate=2023-11-29T16:47:00" -o Enextgendata.csv
```

Here's the breakdown of the `curl` command:

- `-H "Authorization: Bearer 7d91cd716d2ed25c24d909e61116506534a421f0"`: This sets the HTTP header for authorization with the Bearer token (your API key).
- `"http://localhost:3000/api/v1/mtn_lte/data?startDate=2023-11-29T15:47:00&endDate=2023-11-29T16:47:00"`: The URL of your API endpoint, including query parameters for `startDate` and `endDate`.
- `-o Enextgendata.csv`: This option tells `curl` to output the response to a file named `Enextgendata.csv`.

This `curl` command will make a GET request to your API endpoint and save the response data to a file named `Enextgendata.csv`. Remember to replace the API URL, dates, and API key with the actual values you want to use in your real environment.

To create a `curl` command that aligns with the `sort`, `limit`, and `offset` parameters as specified in the JavaScript script [here](JavascriptclientAPI/fetchData.js) , you would construct it like this:

```bash
curl -X GET 'http://localhost:3000/api/v1/mtn_lte/data?startDate=2023-11-29T15:47:00&endDate=2023-11-29T16:47:00&sort=desc&limit=10&offset=0' \
  -H 'Authorization: Bearer 7d91cd716d2ed25c24d909e61116506534a421f0' \
  -H 'accept: application/json'
```

This `curl` command includes:

- The base URL for your API (`http://localhost:3000/api/v1/mtn_lte/data`).
- Query parameters for `startDate`, `endDate`, `sort`, `limit`, and `offset`.
- The `Authorization` header with the API key (`Bearer 7d91cd716d2ed25c24d909e61116506534a421f0`).
- The `accept` header to specify that the response should be in JSON format.

When executed, this `curl` command will make a GET request to the API with the specified parameters and should return the relevant data based on these parameters.

To export to a csv format

```bash
curl -X GET "http://localhost:3000/api/v1/mtn_lte/data?startDate=2023-11-29T15:47:00&endDate=2023-11-29T16:47:00&sort=desc&limit=10&offset=0" \
>   -H "Authorization: Bearer 7d91cd716d2ed25c24d909e61116506534a421f0" \
>   -H "accept: text/csv" \
>   -o "Enextgendata.csv"

```


The sort takes asc or desc as it's options


To export to a json format

```bash
curl -X GET 'http://localhost:3000/api/v1/mtn_lte/data?startDate=2023-11-29T15:47:00&endDate=2023-11-29T16:47:00&sort=desc&limit=10&offset=0' \
-H 'Authorization: Bearer 7d91cd716d2ed25c24d909e61116506534a421f0' \
-H 'accept: application/json' \
-o Enextgendata.json
```

## Caution: ⚠️

All commented codes in the different programming languages work correctly


A sample of the   Enextgendata.csv is found 👉 [here](GolangclientAPI\Enextgendata.csv)  👈

## Api docs

The image below describes the input validation method for the API data retrieveal

![alt-text](public/Screenshot-from-input-swagger-validation-information-2023-12-11-13-04-22.png)

### Note

👉 All codes were tested on Ubuntu 20.04 LTS Focal Distribution 👈

- The Bearer 7d91cd716d2ed25c24d909e61116506534a421f0" seen  👆 is just used for example and doesn't work 🔐 as the API key so signup [here]() to get your API 🔑  to have access to the API 🔓
 
### Copyright

<img src="src/assets/enextgen-logo.png" alt="Enextgenwireless Logo" width="100">

© 2023 [Enextgenwireless](https://enextwireless.com/). All Rights Reserved

📧contact us as info@enextgenwireless.com or adesoji@enextgenwireless.com  😊  💃  🕺
