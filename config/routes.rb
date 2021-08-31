Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/search', to: 'bikes#search', as: 'search'


  resources :bikes do
    resources :bookings, only: [ :index, :new, :create, :edit, :update]
    resources :reviews, only: [ :index, :new, :create ]
  end

  resources :reviews, only: [ :show, :edit, :update, :destroy ]
  resources :bookings, only: [ :show, :destroy ]

  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  get '/user_bikes', to: 'pages#user_bikes', as: "user_bikes"

  # for api
  namespace :api, default: { format: :json } do
    namespace :v1 do
      resources :bikes, only: [ :index, :show, :update ]
    end
  end

end