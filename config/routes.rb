Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#new'
  resources :tales
  resources :users
  resources :sessions
  get '/signup', to: 'users#new'
  get '/welcome', to: 'users#welcome'
  post '/', to: 'sessions#create'
end
