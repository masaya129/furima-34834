Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  # get 'items/index'
  root to: 'items#index'
  # root to: 'articles#index'
  resources :items, only: [:index, :new, :create]
  resources :articles
end
