require 'site_prism'
require 'capybara/rails'
require 'capybara/poltergeist'
require 'letter_opener'

module Capybara::AliasHelper

  def snap
    screenshot_and_open_image
  end

  def saop
    save_and_open_page
  end

  def resources_path(*parts)
    Pathname(File.join(File.realpath(__FILE__), '..', '..', '..', 'resources', *parts)).expand_path
  end

  def preview_email(email)
    delivery = ::LetterOpener::DeliveryMethod.new :location => Rails.root.join("tmp", "letter_opener")
    delivery.deliver!(email)
  end


end

module  Capybara::ComplexInputsHelpers


  def select_date(date, container)
    sub_selects = container.all('select')

    sub_selects[0].find(:option, I18n.l(date, format: '%-d')).select_option
    sub_selects[1].find(:option, I18n.l(date, format: '%B')).select_option
    sub_selects[2].find(:option, I18n.l(date, format: '%Y')).select_option
  end




end



RSpec.configure { |c| c.include Capybara::AliasHelper }
SitePrism::Page.send :include, Capybara::AliasHelper
SitePrism::Section.send :include, Capybara::AliasHelper

RSpec.configure { |c| c.include Capybara::ComplexInputsHelpers }
SitePrism::Page.send :include, Capybara::ComplexInputsHelpers
SitePrism::Section.send :include, Capybara::ComplexInputsHelpers
