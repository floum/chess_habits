Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
  get '/training', to: 'training#index', as: :training
  get '/prep', to: 'prepare#index', as: :preparation
  get '/prep/:lichess_id', to: 'prepare#new'
  post '/sign_out', as: :sign_out, to: 'users#sign_out'
  post '/users/log_in', to: 'users#log_in'
  resources :users, only: [:create] do
  end

  resources :puzzles, only: [:create]
  resources :repertoire_moves, only: [:create]

  resources :lichess_games

  namespace :api, defaults: { format: :json } do
    resources :puzzles
    get '/analysis', to: 'positions#analyze', as: :analysis
    post '/analyses', to: 'analyses#create'
    get '/users/:name', to: 'users#show'
    resources :positions
    resources :moves
  end

  root "users#sign_in"
end
