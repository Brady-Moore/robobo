Rails.application.routes.draw do
  root "pages#home"

  devise_for :users

  resources :users, only: [:show]
  resources :conversations, only: [:index, :show, :new, :create, :destroy] do
    resources :responses, only: [:create]
  end
end
