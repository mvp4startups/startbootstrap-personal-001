Rails.application.routes.draw do
  root "static_pages#home"
  get 'resume', to: 'static_pages#resume'
  get 'projects', to: 'static_pages#projects'
  get 'contact', to: 'static_pages#contact'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end