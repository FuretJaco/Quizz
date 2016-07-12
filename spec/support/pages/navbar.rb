module Spec
  module Pages
    class Navbar < SitePrism::Page

      elements :alerts, '.alert'

      purpose_element :login_link
      purpose_element :logout_button


      def visit_login_page
        login_link.click
      end



      def logout
        logout_button.click
      end


      def has_alert_containing?(message)
        has_alerts?(text: message)
      end




    end
  end
end
