Rails.application.routes.draw do
  root 'questionnaires#index'
  resources :questionnaires
end
