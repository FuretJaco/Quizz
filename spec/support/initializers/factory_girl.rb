# require 'faker'
require 'factory_girl'

module FactoryGirl::SyntaxSugar

  def resources_path(*parts)
    Pathname(File.join(File.realpath(__FILE__), '..', '..', '..', 'resources', *parts)).expand_path
  end

  def resources_file(*parts)
    File.new resources_path(*parts)
  end

end
FactoryGirl::SyntaxRunner.include FactoryGirl::SyntaxSugar

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include FactoryGirl::SyntaxSugar

  config.before(:suite) do
    FactoryGirl.factories.clear
    FactoryGirl.sequences.clear
    FactoryGirl.find_definitions
  end

end
