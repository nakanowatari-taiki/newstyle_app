Rails.application.routes.draw do
  get 'toppages/index'
  devise_for :users
  root to: "toppages#index"
  resources :plans do
    resources :comments, only: :create
  end
  resources :users, only: :show 
end
