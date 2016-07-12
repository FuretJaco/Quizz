require 'database_cleaner'



# Don't get confused by this module it is just there because
# DatabaseCleaner is not able to tell what the current strategy
# is (DatabaseCleaner.strategy won't work [sigh..])
module Strategy
  def self.set(value)
    @strategy = value
    if transaction?
      DatabaseCleaner.strategy= value
    else
      DatabaseCleaner.strategy= value, { except: exceptions}
    end
    @strategy
  end

  def self.get
    @strategy
  end

  def self.truncation?
    @strategy == :truncation
  end

  def self.transaction?
    @strategy == :transaction
  end

  def self.exceptions
    [
        #add here the table names which are loaded in db seed and you do not want to be erased between tests.
    ]
  end
end


RSpec.configure do |config|

  config.before(:suite) do
    if config.respond_to?(:use_transactional_fixtures?) && config.use_transactional_fixtures?
    Strategy.set :transaction
    DatabaseCleaner.clean_with :truncation
    load "db/seeds.rb"
  end



  config.before(:each) do
    driver_shares_db_connection_with_specs = !Object.const_defined?('Capybara') ||  Capybara.current_driver == :rack_test

    if driver_shares_db_connection_with_specs
      Strategy.set :transaction
    else
      Strategy.set :truncation
    end
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    # if you store files during tests, add here the cleaning logic
    DatabaseCleaner.clean
  end

end
