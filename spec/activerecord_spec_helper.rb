require 'spec_helper'

require 'active_record'
require 'factory_girl'
require 'yaml'

db_configurations = YAML::load(ERB.new(File.read("config/database.yml")).result)


ActiveRecord::Base.send(:configurations=, db_configurations)
ActiveRecord::Base.establish_connection(:test)


require_relative "support/initializers/factory_girl"
require_relative "support/initializers/database_cleaner"


require_relative 'support/overrides/devise'






