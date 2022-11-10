Rails.application.routes.draw do
  devise_for :users
  resources :specialities
  resources :doctors
  resources :patients
  resources :appointments

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "doctors#index"
end
