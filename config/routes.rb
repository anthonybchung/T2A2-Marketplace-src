Rails.application.routes.draw do
  get 'teachers/index'

  devise_for :users
  
  get 'guests/index'
  get 'guests/about'
  get 'guests/help'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "guests#index"
end
