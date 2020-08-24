Rails.application.routes.draw do
  root 'pages#index'
  get "pages/help"
  
  resources :users
  
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :topics
end