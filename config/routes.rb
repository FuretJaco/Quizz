Rails.application.routes.draw do

  #devise_for :admin_users, ActiveAdmin::Devise.config
  #ActiveAdmin.routes(self)
  #root to: "home#index"
  devise_for :users
  ActiveAdmin.routes(self)
   
  authenticate :user do
  	resources :options, only: [:new, :create, :update, :destroy]
    #resources :active_admin
  end 
  root to: "questions#index"	

  resources :questions do
  	resources :options, :except => [:show]
  end

  resources :participations, only: [:create] do
    resources :quizzes, only: [] do 
      resources :questions, only: [] do
        resources :answers, only: [:new, :create]
      end 
    end
  end 
  
  scope module: :front do
    resource :home, only: [:show]
  end
  scope "/:locale", locale: /en|fr/ do 
    resources :questions
    resources :participations
    resources :answers
  end 

end
