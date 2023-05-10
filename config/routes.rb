Rails.application.routes.draw do
  resources :experiences
  resources :projects, except: :show
  # get 'projects', to: 'static_pages#projects'
  
  resources :messages
  get 'contact', to: 'static_pages#contact'
  get 'thankyou', to: 'static_pages#thankyou'

  root "static_pages#home"
  get 'resume', to: 'static_pages#resume'
  get 'privacy', to: 'static_pages#privacy'
  get 'terms', to: 'static_pages#terms'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
