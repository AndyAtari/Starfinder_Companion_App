Rails.application.routes.draw do

  
  resources :users
  
  resources :campaigns do 
    resources :starships
  end
  
  
  resources :characters
  resources :starships 
  root 'site#index'

end
