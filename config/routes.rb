Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/search', to: 'bikes#search', as: 'search'


  resources :bikes
end
