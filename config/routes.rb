Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :users, only: [:edit, :show, :update, :destroy, :index]
  resources :posts do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :areas, only: :show
end
