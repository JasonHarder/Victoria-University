Rails.application.routes.draw do
  
  get 'conversations/create' => 'conversations#create'

  get 'conversations/add_to_conversations' => 'conversations#add_to_conversations'

  get 'conversations/conversated?' => 'conversations#conversated?'

  devise_for :users
  resources :news 
  resources :users

  root to: "home#index"
  
  resources :conversations, only: [:create]

  get '/' => 'home#index'
  
  get 'payment/index' => 'payment#index'

  get 'contact/index' => 'contact#index'

  get 'campus/index' => 'campus#index'
  
  get 'admission/index' => 'admission#index'

  get 'academic/index' => 'academic#index'

  get 'schools/index' => 'schools#index'

  get 'about/index' => 'about#index'

  get 'home/index' => 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end 
