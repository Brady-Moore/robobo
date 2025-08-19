Rails.application.routes.draw do
  root "pages#home"

  devise_for :users

  resources :users, only: [:index, :show]
    # except update and edit for now, in the future we can make the user change the title of the conversation
  resources :conversations, except: [:edit, :update] do
    resources :responses, only: [:index, :create, :show]
  end
end
