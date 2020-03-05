Rails.application.routes.draw do
  resources :meds
  resources :pets
  resources :users
  resources :veterinarians
  resources :sessions

  get 'sms' => 'twilio#sms'

  # github incoming authorization
  get '/auth/:provider/callback', to: 'sessions#create'

  root 'sessions#welcome'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  get 'send_mail' => 'users#send_mail'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
