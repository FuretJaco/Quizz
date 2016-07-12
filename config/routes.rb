Rails.application.routes.draw do
  scope module: :front do
    resource :home, only: [:show]
  end



  root to: redirect("home", status: 302)
end
