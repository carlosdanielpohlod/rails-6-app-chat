Rails.application.routes.draw do
  devise_for :users
  resources :messages
  resources :users
  mount ActionCable.server => '/cable'
  root 'messages#index'
  post '/messages/new' => 'messages#create', :defaults => { :format => 'json' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
