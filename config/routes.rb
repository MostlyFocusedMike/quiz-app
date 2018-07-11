Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:new, :edit]
  resources :topics, only: [:index, :show] do
    resources :questions, only: [:index]
  end
  resources :scores, only: [:index, :show, :create]
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      get '/reauth', to: 'auth#show'
    end
  end
end
