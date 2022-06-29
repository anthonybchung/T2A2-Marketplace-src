Rails.application.routes.draw do
  get 'students/index'
  get 'teachers/index'

  devise_for :users
  
  get 'guests/index'
  get 'guests/about'
  get 'guests/help'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  #----- courses ----
  get '/courses/filter', to: 'courses#filter', as: 'filter_list'
  resources :courses
 

  root "guests#index"
end
