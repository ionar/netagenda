Rails.application.routes.draw do
  resources :appointments
  resources :calendars
  resources :services
  get 'welcome/index'
  get 'welcome/cadastros'
  resources :clients
  root to: 'welcome#index'
  devise_for :users, :path_prefix => 'my', controllers: {
        sessions: 'users/sessions'
  }
  resources :users

  get "/qual_dia" => 'appointments#diasel', as: 'qual_dia'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ##get "/myCalendar" => 'appointments#calendar'
end
