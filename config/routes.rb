Rails.application.routes.draw do
  root 'chatrooms#index'
  resources :chatrooms, except: [:index]
  resources :questionnaires
end
