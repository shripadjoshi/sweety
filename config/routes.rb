Rails.application.routes.draw do
  devise_for :users
  
  #this will generate the routes for the readings
  #generating only index, show, new and create routes
  resources :readings, only: [:index, :show, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
