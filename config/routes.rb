Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :users, only: [:edit, :show, :update, :destroy, :index]
  resources :posts, only: [:index, :new, :create]
end
