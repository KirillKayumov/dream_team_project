Rails.application.routes.draw do
  devise_for :users
  root to: "feed#index"

  resources :users, only: [:show, :index]
  resources :posts, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
  resource :relationship, only: [:create, :destroy]
  resources :reactions, only: [:create, :destroy]
  resource :search, only: [:show]
end
