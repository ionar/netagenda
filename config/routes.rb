Rails.application.routes.draw do
  resources :services
  get 'welcome/index'
  resources :clients
  root to: 'welcome#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
