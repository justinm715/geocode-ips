require File.expand_path(File.expand_path(File.dirname(__FILE__)) + '/../../config/config.rb')

users_file_path =  File.join(RESOURCES_PATH, 'transactions6-user-ips.csv')

DB.exec(""" 
  CREATE TEMP TABLE temp_users
  (
    user_id INTEGER,
    username VARCHAR(255),
    ip VARCHAR(40)
  )
  ON COMMIT DROP;

  COPY 
    temp_users
  FROM '#{users_file_path}'
  WITH (
    HEADER TRUE,
    FORMAT CSV,
    DELIMITER '|'
  );

  INSERT INTO users (
    user_id,
    username,
    ip
  )
  SELECT 
    user_id, 
    username, 
    ip 
  FROM temp_users 
  WHERE 
    temp_users.user_id NOT IN (SELECT user_id FROM users);
""")
