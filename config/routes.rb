Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'
  
  root 'application#index'
  resources :tales
  resources :users
  resources :sessions
  get '/tags/:name' => 'tags#show', as: :tag
  get '/signup', to: 'users#new'
  get '/welcome', to: 'users#welcome'
  post '/sessions/new', to: 'sessions#create'
  post '/updateline' => 'line#show'
  post '/createline' => 'line#create'
  post '/saveline' => 'line#update'
end
