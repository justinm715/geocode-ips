APP_ROOT_PATH = File.expand_path(File.expand_path(File.dirname(__FILE__)) + '/../')
RESOURCES_PATH = File.expand_path(File.expand_path(File.dirname(__FILE__)) + '/../resources')
DUMPS_PATH = File.expand_path(File.expand_path(File.dirname(__FILE__)) + '/../dumps')

require 'debugger'
require 'pg'

DB = PG.connect(
  host: 'localhost',
  dbname: 'geo-user-ips'
)

