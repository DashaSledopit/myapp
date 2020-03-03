Rails.application.routes.draw do

  root 'home#index'
  #get 'labs/index'
  namespace :admin do
      resources :users

      root to: "users#index"
    end

  resources :labs, path: 'home/index'


  resources :candidates

  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" , confirmations: 'confirmations' }

  
  
end
