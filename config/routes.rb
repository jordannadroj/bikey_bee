Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/search', to: 'bikes#search', as: 'search'


  resources :bikes do
    resources :bookings, only: [ :index, :new, :create ]
    resources :reviews, only: [ :index, :new, :create ]
  end
  resources :bookings, only: [ :edit, :update, :destroy, :show, :index ]

  resources :reviews, only: [ :show, :edit, :update, :destroy ]
  resources :bookings, only: [ :show, :edit, :update, :destroy ]

  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  get '/user_bikes', to: 'pages#user_bikes', as: "user_bikes"
end
