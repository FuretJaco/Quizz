class ApplicationController < ActionController::Base
  # extend HasAssigns # please do not set instance variable between controller and template
  # include LocaleAware # manage locale from request
  protect_from_forgery with: :exception

end
