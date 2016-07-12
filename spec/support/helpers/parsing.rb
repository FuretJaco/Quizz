module ParsingHelper
  def parsed_response
    @parsed_response ||= JSON.parse response.body
  end
end


RSpec.configure do |config|
  config.include ParsingHelper, type: :request
end
