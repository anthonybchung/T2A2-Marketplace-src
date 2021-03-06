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
  get '/courses/search', to: 'courses#search', as: 'search_courses'
  get '/courses/enrollment/:id', to: 'courses#enrollment', as: 'enrollment'
  resources :courses

  #----- student_courses ---
  get '/student_courses/search',to: 'student_courses#search', as: 'search_student_course'
  resources :student_courses
 
  #----- Enrolled users/students ----
  resources :enrolled
  patch '/enrolled/:id', to: 'enrolled#update', as: 'update_enrolled'

  #----- Excusions ------
  resources :excursions

  #------ Student Excursions -----
  resources :student_excursions

  #------ Student Groups ----
  resources :student_groups
  patch '/student_group/:id', to: 'student_groups#update', as: 'update_student_group'

  #------ passengers ------
  resources :passengers

  root "guests#index"
end
