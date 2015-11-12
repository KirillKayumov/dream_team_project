Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "registrations",
    sessions: "sessions"
  }
  root to: "pages#home"

  resources :users, only: [:show, :index] do
    resources :posts, only: [:show]
  end
  resources :posts, only: [:new, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
  resource :relationship, only: [:create, :destroy]
  resources :reactions, only: [:create, :destroy]
  resource :search, only: [:show]
  resource :feed, only: [:show]
end
