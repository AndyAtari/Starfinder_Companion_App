Rails.application.routes.draw do

  
  resources :characters
  root 'site#index'

end
