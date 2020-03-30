Rails.application.routes.draw do

  
  root 'home#index'

  namespace :admin do
      resources :users

      root to: "users#index"
    end

  resources :labs
  resources :questions
  resources :candidates
  resources :tests do
    post :approve
  end

  resources :attempts, only: [:show, :index]


  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" , confirmations: 'confirmations' }

  
  
end
