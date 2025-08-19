Rails.application.routes.draw do
  get 'users/show'
  root "pages#home"

  devise_for :users

  resources :users, only: [:show] do
    resources :conversations do
      resources :responses, only: [:index, :create, :show]
    end
  end
end