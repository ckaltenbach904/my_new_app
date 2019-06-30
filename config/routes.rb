Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { registrations: "user_registrations" }
  ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users
  resources :payments
  post "payments/create"
  resources :products do
    resources :comments
  end  
  resources :orders, only: [:index, :show, :create, :destroy]
  get 'simple_pages/products'
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/landing_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'simple_pages#index'
  post 'simple_pages/thank_you'
  mount ActionCable.server => '/cable'
end
