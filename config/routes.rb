Rails.application.routes.draw do

  
  resources :attempts
  root 'home#index'

  namespace :admin do
      resources :users

      root to: "users#index"
    end

  resources :labs
  resources :questions
  resources :candidates
  resources :tests

  resources :results

  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" , confirmations: 'confirmations' }

  
  
end
