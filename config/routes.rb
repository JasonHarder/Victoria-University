Rails.application.routes.draw do

  get 'naturalappliedsci/index'

  get 'mgmttech/index'

  get 'investors/index'

  root 'home#index'

  get '/' => 'home#index'

  devise_for :users, controllers: {registrations: "registrations"}

  resources :events, shallow: true do
    resources :event_pictures
  end



  resources :teachers, shallow: true do
    resources :teacher_pictures
  end

  resources :charges
  resources :naturalappliedsci, only: [:index]
  resources :creativeappliedss, only: [:index]
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