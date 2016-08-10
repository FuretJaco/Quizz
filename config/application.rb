require_relative 'boot'

require 'rails/all'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Quizzighted
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.default_mailer_from= "info@seraphin.be" # this can be used in initializers. It must be set before
    # Where the I18n library should search for translation files
    #I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]
 
    # Set default locale to something other than :en
    #I18n.default_locale = :fr
  end
end
