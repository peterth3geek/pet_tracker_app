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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
