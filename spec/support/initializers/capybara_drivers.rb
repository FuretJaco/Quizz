require 'capybara'
require 'capybara/poltergeist'
require 'capybara/rails'
require 'capybara/rspec'
require 'selenium-webdriver'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(
      app,
      js_errors: true, # break on js error
      timeout: 180, # maximum time in second for the server to produce a response
      debug: false, # more verbose log
      window_size: [1280, 800], # not responsive, used to simulate scroll when needed
      inspector: false, # use debug breakpoint and chrome inspector
      phantomjs_options: ['--ignore-ssl-errors=yes'] ,
      # extensions: [Rails.root.join('spec', 'support', 'phantomjs_ext', 'geolocation.js').expand_path.to_s]
  )
end


Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end


Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end


Capybara.javascript_driver = ENV.fetch('DRIVER') { 'poltergeist' }.to_sym
Capybara.asset_host = 'http://localhost:3000' # enable asset in save_and_open_page if we have a dev server running


Capybara.configure do |config|
  config.default_selector = :css
  config.default_max_wait_time= 5
  config.match = :prefer_exact
  config.ignore_hidden_elements = true
end

[:chrome, :firefox, :poltergeist].each do |driver|
  RSpec.configure do |config|
    config.around(:each, driver) do |example|
      current_javascript_driver = Capybara.javascript_driver
      current_default_driver = Capybara.default_driver
      Capybara.javascript_driver = driver
      Capybara.default_driver = driver
      example.run
      Capybara.javascript_driver = current_javascript_driver
      Capybara.default_driver = current_default_driver
    end
  end
end

