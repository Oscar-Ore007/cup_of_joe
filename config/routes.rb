Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  resources :reviews
  resources :coffees
  resources :brands
  resources :users
  get 'coffee/index'
  get 'coffee/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
