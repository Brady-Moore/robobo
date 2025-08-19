Rails.application.routes.draw do
  root "pages#home"

  devise_for :users
    resources :users, only: [:index, :show] do
    resources :conversations do
    resources :responses, only: [:index, :create, :show]
    end
  end
end
