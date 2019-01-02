Rails.application.routes.draw do
  resources :clients
  root to: 'institutes#index'
  resources :institutes
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
