Rails.application.routes.draw do
  root "pages#home"

  devise_for :users

  resources :users, only: [:index, :show] do
    resources :conversations do
      resources :responses, only: [:index, :create, :show]
    end
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> deaf45c0398b371dbb0c0f3c4e478df2c38d522e
