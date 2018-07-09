Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :topics, only: [:index, :show, :create]
  resources :questions, only: [:index, :create]
  resources :scores, only: [:show, :create]
end
