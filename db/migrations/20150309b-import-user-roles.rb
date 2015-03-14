require File.expand_path(File.expand_path(File.dirname(__FILE__)) + '/../../config/config.rb')

users_file_path =  File.join(RESOURCES_PATH, 'transactions6-user-roles.csv')

DB.exec("""
 ALTER TABLE users
 ADD COLUMN role VARCHAR(40);
""")

DB.exec(""" 
  CREATE TEMP TABLE temp_user_roles
  (
    user_id INTEGER,
    username VARCHAR(255),
    ip VARCHAR(40),
    roles VARCHAR(40)

  )
  ON COMMIT DROP;

  COPY 
    temp_user_roles
  FROM '#{users_file_path}'
  WITH (
    HEADER TRUE,
    FORMAT CSV,
    DELIMITER ','
  );

  WITH mappings AS (
    SELECT user_id, roles FROM temp_user_roles
  )
  UPDATE users AS target
  SET role = mappings.roles
  FROM users
  LEFT JOIN mappings ON users.user_id = mappings.user_id
  WHERE target.user_id = mappings.user_id;
""")
