require 'launchy'
require 'capybara/rspec'
require 'capybara-screenshot'
require 'capybara-screenshot/rspec'

Capybara.save_and_open_page_path = Rails.root.join('tmp', 'save_and_open_page')
Capybara::Screenshot.prune_strategy = { keep: 10 }

Capybara::Screenshot.register_driver(:chrome) do |driver, path|
  driver.browser.save_screenshot path
end

Capybara::Screenshot.register_driver(:firefox) do |driver, path|
  driver.browser.save_screenshot path
end
