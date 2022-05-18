Rails.application.routes.draw do
  resources :orders
  resources :comments
  resources :movie_details
  resources :movies
  resources :users
  root 'main#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
