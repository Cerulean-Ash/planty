Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/cart', to: 'carts#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :plants do
    resources :purchases, only: [:new, :create]
  end
  resources :users
  resources :carts
end
