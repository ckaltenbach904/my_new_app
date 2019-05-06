Rails.application.routes.draw do
  resources :products 
  resources :orders, only: [:index, :show, :create, :destroy]
  get 'simple_pages/products'
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/contact'
  get 'simple_pages/landing_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'simple_pages#index'
  post 'simple_pages/thank_you'
end
