Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders, only: [:index, :create]
    resources :user_buy_addresses, only: [:index, :show]
  end
end
