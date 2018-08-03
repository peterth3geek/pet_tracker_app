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
  root 'welcome#index'
  get 'signup', to: 'owners#new', as: 'signup'
  post 'signup', to: 'owners#create', as: 'signups'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  post 'sessions', to: 'sessions#create', as: 'sessions'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
