Rails.application.routes.draw do

  
  resources :campaigns
  resources :characters
  root 'site#index'

end
