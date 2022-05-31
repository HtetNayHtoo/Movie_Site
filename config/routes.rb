Rails.application.routes.draw do
  get 'cart/show'
  get 'home/index'
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'password/reset', to: "password_resets#new"
  post 'password/reset', to: "password_resets#create"

  get 'password/reset/edit', to: "password_resets#edit"
  patch 'password/reset/edit', to: "password_resets#update"

  get 'order/movie/:movie_id', to: "orders#new", as: 'order/movie'
  resources :orders do
    collection do
      post :confirm
    end
  end
 resources :likes , only: [:create,:destroy]
  resources :movie_details
  resources :movies do
    resources :orders
    resources :comments,only: [:create,:destroy] 
  end
  resources :favourites, only: [:create, :destroy]
  resources :movies
  resources :users do
    collection do
      post :confirm
    end
  end

  root 'sessions#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
