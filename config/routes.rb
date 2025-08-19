Rails.application.routes.draw do
  root "pages#home"

  devise_for :users

    resources :conversations do
      resources :responses, only: [:index, :create]
    end
end