Rails.application.routes.draw do


  root to: 'properties#main'
  # 2. Form submit, create, redirect to index
  get '/properties/new' => 'properties#new', as: 'new_property'

  post '/properties' => 'properties#create'
  get '/properties' => 'properties#index'
  get '/properties/:id' => 'properties#show', as: 'property'
  # UPDATE
  # 1. Pre-filled form for a specific artist by ID
  get '/properties/:id/edit' => 'properties#edit', as: 'edit_property'

  # 2. Form submit, update property, redirect to show
  patch '/properties/:id' => 'properties#update'
  get '/search' => 'properties#search'
  delete '/properties/:id' => 'properties#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Session routes:
  get '/login' => 'session#new' # login form
  # form submits here, do authentication & create session & redirect, or show form with errors
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :users
  resources :brokers
end
