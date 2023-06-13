require 'active_record'
require 'yaml'

env = ENV['RACK_ENV'] || 'development'
db_config = YAML.safe_load(File.read('config/database.yml'), aliases: true)[env]
ActiveRecord::Base.establish_connection(db_config)