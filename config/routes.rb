Rails.application.routes.draw do
  #root to: "home#index"
  devise_for :users
  ActiveAdmin.routes(self)
   
  authenticate :user do
  	resources :options, only: [:new, :create, :update, :destroy]
  end 
  root to: "questions#index"	
  resources :quizzes do
    resources :questions do
  	 resources :options, :except => [:show]
    end
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
    resources :quizzes
  end 

end
