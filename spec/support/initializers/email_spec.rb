require 'email_spec'


RSpec.configure do |config|
  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)
  config.before(:each) { ActionMailer::Base.deliveries.clear }
end


# https://github.com/bmabey/email-spec/issues/72
require 'email_spec/helpers'
module EmailSpec
  Helpers.module_eval do
    def links_in_email(email)
      part = email.default_part
      if part.content_type =~ /text\/html/
        Nokogiri::HTML::Document.parse(part.body.to_s).search('a').map{|a| a[:href] }
      else
        URI.extract(part.body.to_s, ['http', 'https'])
      end
    end
  end


end
