Rails.application.routes.draw do
  resources :search_suggestions
  root 'home#index'
end
