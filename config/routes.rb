Rails.application.routes.draw do

  get 'sessions/create'

  get 'sessions/sign_in_and_redirect'

  get 'sessions/failure'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'overview/index'

  get 'naturalappliedsci/index'

  get 'mgmttech/index'

  get 'investors/index'

  root 'home#index'

  get '/' => 'home#index'

  devise_for :users, controllers: {sessions: 'sessions'}
  # Bring back to {registrations: 'registrations'}
  # https://stackoverflow.com/questions/32237818/devise-sign-in-sign-up-in-popup
  # Check above link for changes to user (changed it from a seperate page to a modal with help from that post.)
  resources :events, shallow: true do
    resources :event_pictures
  end



  resources :teachers, shallow: true do
    resources :teacher_pictures
  end
  resources :overview, only: [:index]
  resources :charges
  resources :naturalappliedsci, only: [:index]
  resources :creativeapplied, only: [:index]
  resources :investors, only: [:index]
  resources :mgmttech, only: [:index]
  resources :home, only: [:index]
  resources :campus, only: [:index]
  resources :admissions, only: [:index]
  resources :schools, only: [:index,:creativeappliedss,:mgmttech,:naturalapplied]
  resources :contacts, only: [:index]
  resources :academics, only: [:index]
  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]

  end
end