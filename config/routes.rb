Rails.application.routes.draw do

  get '/signin' => "sessions#new"
  post '/signin' => "sessions#create"
  delete '/signin' => "session#destroy"
  
  
  resources :users
  
  resources :campaigns do 
    resources :starships
  end
  
  resources :characters
  resources :starships 
  root 'site#index'

end
