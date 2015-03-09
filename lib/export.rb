require File.expand_path(File.expand_path(File.dirname(__FILE__)) + '/../config/config.rb')

output_path = File.join(DUMPS_PATH, 'located_users_output.csv')

DB.exec """
  COPY (
    SELECT
      user_id,
      username,
      latitude,
      longitude
    FROM users
    WHERE latitude IS NOT NULL
    ORDER BY user_id ASC
  ) TO '#{output_path}' WITH (FORMAT CSV, HEADER, DELIMITER ',') 
"""