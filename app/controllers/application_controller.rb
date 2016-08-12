class ApplicationController < ActionController::Base
  # extend HasAssigns # please do not set instance variable between controller and template
  # include LocaleAware # manage locale from request
  include Pundit
  protect_from_forgery with: :exception
  add_flash_types :success, :warning, :danger, :info
	before_action :set_locale
	before_action :authenticate_user!, :except => [:index, :show] 

 rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

 
 	
	def set_locale
		I18n.locale = params[:locale] || I18n.default_locale
	end

	def default_url_options
  	{ 
  		locale: I18n.locale 
  	}
	end

	private

 	def user_not_authorized(exception)
	   policy_name = exception.policy.class.to_s.underscore
	
	   flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
	   redirect_to(request.referrer || root_path)
	end
end
