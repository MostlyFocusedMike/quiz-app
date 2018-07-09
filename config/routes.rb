Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:new, :edit]
  resources :topics, only: [:index, :show]
  resources :questions, only: [:index]
  resources :scores, only: [:index, :show, :create]
end
