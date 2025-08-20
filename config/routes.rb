Rails.application.routes.draw do
  root "conversations#new"

  devise_for :users

  resources :users, only: [:show]
  resources :conversations, except: [:edit, :update] do
    resources :responses, only: [:create]
  end
end
