require File.expand_path(File.expand_path(File.dirname(__FILE__)) + '/../../config/config.rb')

geo_city_blocks_file_path =  File.join(RESOURCES_PATH, 'GeoLite2-City-CSV_20150303', 'GeoLite2-City-Blocks-IPv4.csv')

DB.exec(""" 
  COPY 
    geoip 
  FROM '#{geo_city_blocks_file_path}'
  WITH
    (
      HEADER TRUE,
      FORMAT CSV,
      DELIMITER ','
    )
""")
