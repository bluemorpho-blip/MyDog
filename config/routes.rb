Rails.application.routes.draw do
  resources :meds
  resources :pets
  resources :owners
  resources :veterinarians
  resources :sessions

  root 'sessions#welcome'

  get 'signin' => "sessions#login"
  post 'signin' => 'sessions#create'
  get 'signup' => 'owners#new'
  post 'signup' => 'owners#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
