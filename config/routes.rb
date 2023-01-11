Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
  get '/training', to: 'training#index', as: :training
  get '/prepare', to: 'prepare#index', as: :preparation
  post '/sign_out', as: :sign_out, to: 'users#sign_out'
  post '/users/log_in', to: 'users#log_in'
  resources :users, only: [:create] do
  end

  resources :puzzles, only: [:create]

  namespace :api, defaults: { format: :json } do
    resources :puzzles
  end

  root "users#sign_in"
end
