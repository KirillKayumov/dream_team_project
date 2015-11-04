Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:show, :index]
  resources :posts, only: [:new, :create, :show] do
    resources :comments, only: :create
  end
  resources :relationships, only: :create
  resources :reactions, only: :create
end
