Rails.application.routes.draw do
  devise_for :users
  resources :students do
    collection { post :import }
  end
  resources :message_histories
  resources :carriers
  resources :messages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  
   get 'home/dashboard'
   get 'home/homepage'
   root 'home#homepage'
end
