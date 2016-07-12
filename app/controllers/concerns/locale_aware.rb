module LocaleAware
  extend ActiveSupport::Concern

  included do
    around_action :with_locale

    helper_method :language_switcher_options
    helper_method :locale
    helper_method :available_locales
    helper_method :other_available_locales
  end

  def with_locale
    I18n.with_locale(requested_or_default_locale) { yield }
  end

  def default_url_options
    super.merge(locale: locale)
  end

  def language_switcher_options
    {}
  end

  def locale
    I18n.locale
  end

  def translated_params(*field_names)
    locales = I18n.available_locales
    locales.product(field_names).map{|locale, field_name| "#{field_name}_#{locale}"}
  end

  private

  def requested_or_default_locale
    I18n.available_locales.include?(requested_locale.to_sym) ? requested_locale.to_sym : I18n.default_locale
  end

  def requested_locale
    locale_from_param || locale_from_cookie || locale_from_headers || default_locale
  end

  def locale_from_param

    request.filtered_parameters['locale'] .tap do |locale|
      cookies[:locale_from_param]= locale if locale.present?
    end

    params[:locale].tap do |locale|
      cookies[:locale_from_param]= locale if locale.present?
    end
  end

  def locale_from_cookie
    cookies[:locale_from_param]
  end


  def locale_from_headers
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  rescue
    nil
  end

  def default_locale
    I18n.default_locale
  end


  def available_locales
    I18n.available_locales
  end

  def other_available_locales
    I18n.available_locales - [locale]
  end

end
