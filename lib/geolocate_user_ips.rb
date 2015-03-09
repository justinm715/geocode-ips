require File.expand_path(File.expand_path(File.dirname(__FILE__)) + '/../config/config.rb')
require 'geocoder'

results = DB.exec """
  SELECT 
    * 
  FROM 
    users 
  WHERE ip IS NOT NULL
  ORDER BY user_id ASC
"""

total = results.count

results.each_with_index do |result, idx|
  puts "Processing #{idx+1} of #{total}"
  # skip if no ip or if location present
  next if result['ip'] == nil or result['latitude'] != nil
  geo_results = Geocoder.search(result['ip'])
  next unless geo_results.length > 0
  data = geo_results[0].data
  s = DB.exec """
    UPDATE users
    SET
      latitude = #{data['latitude'] || 'NULL'},
      longitude = #{data['longitude'] || 'NULL'},
      country_code = '#{data['country_code']}',
      country_name = '#{data['country_name']}',
      region_code = '#{data['region_code'].gsub("'","")}',
      region_name = '#{data['region_name'].gsub("'","")}',
      city = '#{data['city'].gsub("'","")}',
      zip_code = '#{data['zip_code']}',
      time_zone = '#{data['time_zone']}',
      metro_code = '#{data['metro_code']}'
    WHERE users.user_id = #{result['user_id']}
  """
end
