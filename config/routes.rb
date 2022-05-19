Rails.application.routes.draw do
  get 'home/index'
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :orders
  resources :comments
  resources :movie_details
  resources :movies
  resources :users
  root 'main#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
