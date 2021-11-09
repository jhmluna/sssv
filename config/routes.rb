Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :requests, except: :destroy
  # Update requests
  patch 'requests/get/:id', to: 'requests#get', as: :request_get

  authenticate :user, ->(user) { user.admin? || user.role == 'manager' } do
    mount Blazer::Engine, at: "blazer"
  end
end
