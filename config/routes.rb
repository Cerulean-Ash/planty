Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/cart', to: 'carts#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :plants do
    resources :purchases, only: [:new, :create]
  end
  resources :purchases, only: [:show] do
    resources :reviews, only: [:new, :create]
  end
  resources :users
  resources :carts

  get '/checkout', to: 'carts#checkout'

  resources :charges, only: [:new, :create]
end
