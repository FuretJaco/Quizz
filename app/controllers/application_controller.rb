class ApplicationController < ActionController::Base
  # extend HasAssigns # please do not set instance variable between controller and template
  # include LocaleAware # manage locale from request
	before_action :set_locale
 	add_flash_types :success, :warning, :danger, :info
	def set_locale
		I18n.locale = params[:locale] || I18n.default_locale
	end

	def default_url_options
  	{ locale: I18n.locale }
	end

	include Pundit
	protect_from_forgery with: :exception
	before_action :authenticate_user!, :except => [:index, :show] 
end
