class ApplicationMailer < ActionMailer::Base
  extend HasAssigns

  default from: Rails.application.config.default_mailer_from
  layout 'mailer'

  # Uncomment when implementing I18n
  # def default_url_options
  #   super.reverse_merge(locale: mailer_locale)
  # end
  #
   def mailer_locale
     I18n.locale
   end


end
