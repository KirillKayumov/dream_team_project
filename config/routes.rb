Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:show, :index]
  resources :posts, only: [:new, :create, :show]
end
