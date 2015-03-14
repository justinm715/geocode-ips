require File.expand_path(File.expand_path(File.dirname(__FILE__)) + '/../../config/config.rb')

memberships_file_path =  File.join(RESOURCES_PATH, 'transactions6-project-memberships.csv')

DB.exec("""
  CREATE TABLE IF NOT EXISTS project_members
  (
    user_id INTEGER,
    project_id INTEGER
  )
""")

DB.exec(""" 
  COPY 
    project_members
  FROM '#{memberships_file_path}'
  WITH (
    HEADER TRUE,
    FORMAT CSV,
    DELIMITER ','
  );
""")
