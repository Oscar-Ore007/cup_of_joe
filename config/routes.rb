Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  resources :reviews
  resources :coffees
  resources :brands
  resources :users
  get 'coffee/index'
  get 'coffee/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
