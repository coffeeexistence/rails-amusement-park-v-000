Rails.application.routes.draw do


  resources :attractions
  post '/ride' => 'attractions#go_on', as: :go_on_ride
  resources :sessions, only: [:new, :create, :destroy]
  post '/signout' => 'sessions#destroy', as: :signout

  resources :users
  get '/users/new' => 'users#new', as: :user_signup
  get '/signin' => 'sessions#new', as: :signin
  root to: 'users#index'

end