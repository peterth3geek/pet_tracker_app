Rails.application.routes.draw do
  resources :pets
  resources :owners
  resources :relationships
  resources :families
  resources :wastes
  resources :foods
  resources :plays
  resources :conditions
  resources :appointments
  get '/signup', to: 'owners#new'
  post '/signup', to: 'owners#create'
  get '/owner', to: 'owners#show'
  post 'session', to: 'owners#destroy', as: 'logout'
  get '/login', to: 'sessions#new', as: 'login'
  get '/login', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
