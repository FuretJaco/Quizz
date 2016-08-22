source 'https://rubygems.org'
ruby '2.3.1'

# Core
gem 'rails', '~> 5.0.0'
gem 'pg', '~> 0.18.4'


# Rails extensions
gem 'rails-i18n', '~> 5.0'
gem 'devise', '~> 4.2'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'draper', '~> 3.0.0.pre1'

# Front
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails', '~> 4.1', '>= 4.1.1'
gem 'turbolinks', '~> 5'
gem 'foundation-rails', '~> 6.2', '>= 6.2.3.0'
gem 'font-awesome-rails', '~> 4.5'
gem 'slim-rails', '~> 3.1'
gem 'cocoon', '~> 1.2', '>= 1.2.9'
gem 'simple_form', '~> 3.2', '>= 3.2.1'
gem 'carrierwave', '~> 0.11.2'
gem 'mini_magick', '~> 4.5', '>= 4.5.1'
gem 'activeadmin', '~> 1.0.0.pre4'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem "pundit"
gem 'sidekiq', '~> 4.1', '>= 4.1.4'
gem "sentry-raven"


# Misc
gem 'memoist', '~> 0.14.0'
gem 'interactor'



group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :development do
  gem 'better_errors'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  gem 'binding_of_caller'
  gem 'letter_opener'

  gem 'capistrano', '~> 3.4', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano-db-tasks', require: false
  #gem 'capistrano3-puma', require: false
  gem 'capistrano-maintenance', '~> 1.0', require: false
  gem 'airbrussh', require: false
  gem 'highline', require: false
  gem 'capistrano-faster-assets', require: false
  gem 'pry-rails'
end


group :test do
  gem 'capybara', require: false
  gem 'database_cleaner', require: false
  gem 'launchy', require: false
  gem 'site_prism', require: false

  gem 'rspec-collection_matchers', require: false
  gem 'poltergeist', require: false
  gem 'selenium-webdriver', require: false
  gem 'capybara-screenshot', require: false
  gem 'webmock', require: false
  gem 'email_spec', require: false
end
