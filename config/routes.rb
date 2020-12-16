Rails.application.routes.draw do
  get 'orders/index'
  devise_for :users
  root to:"items#index"
  resources :items
  get 'items',to:'items#price'
  resources :orders, only: :index
end
