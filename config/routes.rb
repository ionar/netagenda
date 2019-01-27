Rails.application.routes.draw do
  resources :appointments
  resources :calendars
  resources :services
  get 'welcome/index'
  get 'welcome/success'
  resources :clients
  root to: 'welcome#index'
  devise_for :users, :path_prefix => 'my', controllers: {
        sessions: 'users/sessions'
  }
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ##get "/myCalendar" => 'appointments#calendar'
end
