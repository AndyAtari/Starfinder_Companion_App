Rails.application.routes.draw do

  root 'site#index'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  get '/auth/github/callback' => 'sessions#omniauth'
  
  
  resources :users
  
  resources :campaigns do 
    resources :starships
  end
  
  resources :characters
  resources :starships 
 

end
