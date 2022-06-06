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

  get "/search", to: "movies#search"
  get "/category", to: "movies#category"

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
      collection do 
        post :confirm
      end
  end
  resources :favourites, only: [:create, :destroy]
  resources :movies
  resources :users do
    collection do
      post :confirm
    end
  end

  root 'sessions#new'
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
