## Author: Adesoji Alu
## Company: Enextgenwireless
## Copyright 2023
## Contact: adesoji@enextwireless.com, adesoji.alu@gmail.com

### without the sort and limit option

# import requests
# import pandas as pd

# # API Configuration
# api_key = '7d91cd716d2ed25c24d909e61116506534a421f0'  # Replace with your actual API key
# api_url = 'https://api.enextwireless.com/api/api/v1/mtn_lte/data'

# # Query Parameters
# params = {
#     'startDate': '2023-11-29T15:47:00',
#     'endDate': '2023-11-29T16:47:00'
# }

# # Headers
# headers = {'Authorization': f'Bearer {api_key}'}

# def fetch_data():
#     try:
#         # Send GET request to the API
#         response = requests.get(api_url, headers=headers, params=params)

#         # Check if the request was successful
#         if response.status_code == 200:
#             # Convert response JSON to Pandas DataFrame
#             data = pd.DataFrame(response.json())

#             # Save DataFrame to CSV
#             data.to_csv('Enextgendata.csv', index=False)
#             print('Data exported to Enextgendata.csv 🕺😄')
#         else:
#             print(f'Error fetching data, Please Try again in some hours or PAY 💵 to get the API 🔑 😠: {response.status_code}, {response.text}')
    
#     except Exception as e:
#         print(f': {e}')

# # Execute the function
# fetch_data()



import requests
import pandas as pd

# API Configuration
api_key = '825fedddd36960b7c525070e76cc34970b4470dc'  # Replace with your actual API key
api_url = 'https://api.enextwireless.com/api/api/v1/mtn_lte/data'

# Query Parameters
params = {
    'startDate': '2023-11-29T15:47:00',
    'endDate': '2023-11-29T16:47:00',
    'limit': 10,  # Number of records to return
    'offset': 0,  # Number of records to skip from the start
    'sort': 'asc'  # Sorting order, can be 'asc' or 'desc'
}

# Headers
headers = {'Authorization': f'Bearer {api_key}'}

def fetch_data():
    try:
        # Send GET request to the API
        response = requests.get(api_url, headers=headers, params=params)

        # Check if the request was successful
        if response.status_code == 200:
            # Convert response JSON to Pandas DataFrame
            data = pd.DataFrame(response.json())

            # Save DataFrame to CSV
            data.to_csv('Enextgendata.csv', index=False)
            print('Data exported to Enextgendata.csv 🕺😄')
        else:
            print(f'Error fetching data, Please Try again in some hours or PAY 💵 to get the API 🔑 😠: {response.status_code}, {response.text}')
    
    except Exception as e:
        print(f'Error: {e}')

# Execute the function
fetch_data()



