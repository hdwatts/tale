Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#signin'
  resources :tales
  resources :users
  get '/signup', to: 'users#new'
  get '/welcome', to: 'users#welcome'
  post '/', to: 'sessions#create'
end
