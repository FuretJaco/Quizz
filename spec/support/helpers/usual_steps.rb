

module UsualStepsHelper

  def as(user)
    session_name = "capybara_session_for_#{user.to_param}"
    using_session(session_name) do
      visit new_user_session_path(locale: I18n.default_locale)
      login_page.login user.email, user.password
      yield
      navbar.logout
    end
  end

  def as_guest
    session_name = "capybara_session_for_guest-#{rand(1_000_000)}"
    using_session(session_name) do
      visit unlocalized_root_path
      yield
    end
  end


end

RSpec.configure { |c| c.include UsualStepsHelper, type: :feature }
