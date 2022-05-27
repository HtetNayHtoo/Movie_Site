Rails.application.routes.draw do
  get 'home/index'
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'password/reset', to: "password_resets#new"
  post 'password/reset', to: "password_resets#create"

  get 'password/reset/edit', to: "password_resets#edit"
  patch 'password/reset/edit', to: "password_resets#update"

  resources :orders
 
  resources :movie_details
  resources :movies do
    resources :comments
    collection do #This is important
      post :confirm #This is important
    end
  end
  resources :favourites, only: [:create, :destroy]
  resources :users do
  end
  root 'main#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
