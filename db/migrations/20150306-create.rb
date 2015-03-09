require File.expand_path(File.expand_path(File.dirname(__FILE__)) + '/../../config/config.rb')

DB.exec("""
  CREATE TABLE IF NOT EXISTS users
  (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    username VARCHAR(255),
    ip VARCHAR(40),
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    country_code VARCHAR(255),
    country_name VARCHAR(255),
    region_code VARCHAR(255),
    region_name VARCHAR(255),
    city VARCHAR(255),
    zip_code VARCHAR(255),
    time_zone VARCHAR(255),
    metro_code INTEGER
  )
""")

DB.exec("""
  CREATE TABLE IF NOT EXISTS geoip
  (
    network VARCHAR(40),
    geoname_id INTEGER,
    registered_country_geoname_id INTEGER,
    represented_country_geoname_id INTEGER,
    is_anonymous_proxy BOOLEAN,
    is_satellite_provider BOOLEAN,
    postal_code VARCHAR(40),
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION
  )
""")