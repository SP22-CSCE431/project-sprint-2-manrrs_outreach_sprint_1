Rails.application.routes.draw do

  resources :messages
  resources :students
  resources :students_imports, only: [:new, :create]

  get 'students_imports/new'
  get 'students_imports/create'
  devise_for :users
  
  resources :message_histories
  resources :carriers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   get  "posttext",to:"posttext#posttext"
   get 'home/dashboard'
   get 'home/homepage'
   root 'home#homepage'
end
