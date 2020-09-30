Rails.application.routes.draw do

  root 'site#index'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  get '/auth/github/callback' => 'sessions#omniauth'
  
  
  resources :users, only: [:new, :create]
  
  resources :campaigns do 
    resources :starships, only: [:new, :create, :index]
  end
  
  resources :characters
  resources :starships 
 

end
