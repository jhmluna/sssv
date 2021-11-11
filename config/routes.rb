Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Database admin route
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Authentication route
  devise_for :users

  # Home and user show
  root to: 'pages#home'
  resources :pages, only: %i[index show]

  # Request pages
  resources :requests, except: :destroy
  # Update requests
  patch 'requests/get/:id', to: 'requests#get', as: :request_get
  # Solve requests
  patch 'requests/conclude/:id', to: 'requests#conclude', as: :request_conclude

  # Redirect to index page on successful sign in
  get '/user' => "requests#index", :as => :user_root

  # Blazer dashboard pages
  authenticate :user, ->(user) { user.admin? || user.role == 'manager' } do
    mount Blazer::Engine, at: "blazer"
  end
end
