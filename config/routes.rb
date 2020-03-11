Rails.application.routes.draw do
  resources :meds
  resources :pets
  resources :users
  resources :veterinarians do
    resources :pets, only: [:index, :new]
  end
  resources :sessions

  get 'sms' => 'twilio#sms'

  # google incoming authorization
  get '/auth/:provider/callback', to: 'sessions#create'

  root 'sessions#welcome'

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create_login'
  delete 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
