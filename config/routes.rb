Rails.application.routes.draw do
  
  get 'conversations/create'

  get 'conversations/add_to_conversations'

  get 'conversations/conversated?'

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

  get 'academic/index' 

  get 'news/index'

  get 'news/show'

  get 'news/new'

  get 'news/create'

  get 'news/edit'

  get 'news/update'

  get 'news/destroy'

  get 'schools/index'

  get 'about/index'

  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end 
