Rails.application.routes.draw do
  root 'chatrooms#index'
  resources :chatrooms, only: [:show, :destroy, :create] do
    resources :messages, only: [:create], module: :chatrooms
  end
  resources :questionnaires do
    resources :completions, only: [:create, :show, :destroy], module: :questionnaires
  end
end
