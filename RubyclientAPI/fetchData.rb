## Author: Adesoji Alu
## Company: Enextgenwireless
## Copyright 2023
## Contact: adesoji@enextwireless.com, adesoji.alu@gmail.com

## without sort and limit options

# require 'net/http'
# require 'json'
# require 'csv'
# require 'uri'

# # API Configuration
# api_key = 'dgd91cd716d2ed25c24d909e61116506534a421f0'  # Replace with your actual API key
# api_url = 'https://api.enextwireless.com/api/api/v1/mtn_lte/data'

# # Query Parameters
# params = {
#   'startDate' => '2023-11-29T15:47:00',
#   'endDate' => '2023-11-29T16:47:00'
# }

# uri = URI(api_url)
# uri.query = URI.encode_www_form(params)

# # Create the HTTP GET request
# request = Net::HTTP::Get.new(uri)
# request['Authorization'] = "Bearer #{api_key}"

# begin
#   # Send the request
#   response = Net::HTTP.start(uri.hostname, uri.port) do |http|
#     http.request(request)
#   end

#   # Check if the request was successful
#   if response.is_a?(Net::HTTPSuccess)
#     data = JSON.parse(response.body)

#     # Export to CSV
#     CSV.open('Enextgendata.csv', 'w') do |csv|
#       # Add headers to CSV
#       csv << data.first.keys if data.first
#       # Add data rows to CSV
#       data.each { |row| csv << row.values }
#     end

#     puts 'Data exported to Enextgendata.csv'
#   else
#     puts "Error fetching data, Please Try again in some hours or PAY 💵 to get the API 🔑 😠: #{response.code}, #{response.message}"
#   end

# rescue => e
#   puts "An error occurred: #{e.message}"
# end


require 'net/http'
require 'json'
require 'csv'
require 'uri'

# API Configuration
api_key = '6d91cd716d2ed25c24d909e61116506534a421f0'  # Replace with your actual API key
api_url = 'https://api.enextwireless.com/api/api/v1/mtn_lte/data'

# Query Parameters
params = {
  'startDate' => '2023-11-29T15:47:00',
  'endDate' => '2023-11-29T16:47:00',
  'sort' => 'desc',        # Sorting order
  'limit' => 10,           # Number of records to return
  'offset' => 0            # Number of records to skip
}

uri = URI(api_url)
uri.query = URI.encode_www_form(params)

# Create the HTTP GET request
request = Net::HTTP::Get.new(uri)
request['Authorization'] = "Bearer #{api_key}"

begin
  # Send the request
  response = Net::HTTP.start(uri.hostname, uri.port) do |http|
    http.request(request)
  end

  # Check if the request was successful
  if response.is_a?(Net::HTTPSuccess)
    data = JSON.parse(response.body)

    # Export to CSV
    CSV.open('Enextgendata.csv', 'w') do |csv|
      # Add headers to CSV
      csv << data.first.keys if data.first
      # Add data rows to CSV
      data.each { |row| csv << row.values }
    end

    puts 'Data exported to Enextgendata.csv'
  else
    puts "Error fetching data, Please Try again in some hours or PAY 💵 to get the API 🔑 😠: #{response.code}, #{response.message}"
  end

rescue => e
  puts "An error occurred: #{e.message}"
end
