Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#welcome'
  resources :tales
  resources :users
  get '/signup', to: 'users#new'

end
