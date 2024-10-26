Rails.application.routes.draw do
  resources :perks
  resources :projects do
    resources :comments, module: :projects
  end  
  # resources :comments
  # resources :projects
  # root to: 'static_pages#index'
  resource :subscription

  root to: 'projects#index'  
  get   'about', to: 'static_pages#about'
  get   'contact', to: 'static_pages#contact'
  get   'privacy', to: 'static_pages#privacy'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
