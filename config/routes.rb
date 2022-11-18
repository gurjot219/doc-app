Rails.application.routes.draw do
  # devise_scope :user do
  #   get 'home', action: :new, controller: 'devise'
  # end
  devise_for :users
  resources :specialities
  # get 'profile/:id', action: :show, controller: 'doctors'
  resources :doctors
  resources :patients
  resources :appointments

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_scope :user do
    root "devise/sessions#new"
  end
end
