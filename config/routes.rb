Rails.application.routes.draw do

  root 'site#index'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
  
  
  resources :users
  
  resources :campaigns do 
    resources :starships
  end
  
  resources :characters
  resources :starships 
 

end
