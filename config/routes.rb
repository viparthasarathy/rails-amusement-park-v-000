Rails.application.routes.draw do

  root 'static#home'
  get '/signin', to: 'sessions#new', as: 'new_session'
  delete 'sessions/destroy', to: 'sessions#destroy', as: 'destroy_session'
  post 'sessions/create', to: 'sessions#create'

  resources :users
  resources :attractions
  resources :rides, only: [:create]





end
