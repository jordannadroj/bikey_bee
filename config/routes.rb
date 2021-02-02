Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/search', to: 'bikes#search', as: 'search'


  resources :bikes do
    resources :bookings
    resources :reviews, only: [ :new, :create ]
  end

  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  get '/user_bikes', to: 'pages#user_bikes', as: "user_bikes"
end
