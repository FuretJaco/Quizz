# Load the Rails application.
require_relative 'application'
require 'carrierwave/orm/activerecord'

# Initialize the Rails application.
Rails.application.initialize!

Raven.configure do |config|
  config.dsn = 'https://73c0db7320bc433cbb059f262afff2a8:4e127c2290d446c4b41ba29a5cd06f14@app.getsentry.com/93483'
  config.environments = ['staging', 'production']
end

#default langage 
#config.i18n.default_locale = :en 
