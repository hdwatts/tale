Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tale
  post '/updateline' => 'line#update'
  mount ActionCable.server => '/cable'
end
