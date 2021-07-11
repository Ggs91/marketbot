Rails.application.routes.draw do
  root 'questionnaires#index'
  resources :questionnaires, only: [:new, :create]
end
