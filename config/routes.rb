Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :plants do
    resources :purchases, only: [:create, :edit, :update]
  end
  resources :purchases, only: [:index]
end
