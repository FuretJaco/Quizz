module PageObjectsHelper
  extend Memoist

  def self.page_object(helper_method, page_class)
    define_method(helper_method) do
      page_class.new
    end
    memoize helper_method
  end

  page_object :navbar, Spec::Pages::Navbar
  page_object :home_page, Spec::Pages::HomePage

end


RSpec.configure { |c| c.include PageObjectsHelper, type: :feature }
