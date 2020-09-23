Rails.application.routes.draw do

  
  resources :campaigns do 
    resources :starships
  end
  
  resources :characters
  root 'site#index'

end
