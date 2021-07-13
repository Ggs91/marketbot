Rails.application.routes.draw do
  root 'chatrooms#index'
  resources :chatrooms, only: [:show, :destroy, :create]
  resources :questionnaires
end
