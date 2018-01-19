Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  get "register" => "devise/registrations#new"
  get "edit_profile" => "devise/registrations#edit"
  get "login" => "devise/sessions#new"
  get "logout" => "devise/sessions#destroy"

  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end



end