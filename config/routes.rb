# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :operators
  devise_for :customers
<<<<<<< Updated upstream
  devise_for :operators

  namespace :admin do
    resources :variants, only: :create do
=======
  resources :variants
  resources :users, :orders
  get '/search', to: 'admin/admin_products#search'
  get '/shirts', to: 'admin/admin_products#shirts'
  get '/trousers', to: 'admin/admin_products#trousers'
  get '/shoes', to: 'admin/admin_products#shoes'
  get '/u-search', to: 'users#search'
  get '/u-shirts', to: 'users#shirts'
  get '/u-trousers', to: 'users#trousers'
  get '/u-shoes', to: 'users#shoes'
  get '/admin', to: 'users#verify_admin'
  get 'admin/admin_products/sizes', to: 'admin/admin_products#sizes'
  get '/your_history', to: 'orders#customer_orders'
  root 'users#index'

  namespace :admin do
    resources :variants
    resources :admin_products do
>>>>>>> Stashed changes
      member do
        patch :buy
      end
    end
<<<<<<< Updated upstream
    resources :admin_products, only: %i[index new show create destroy]
  end
  namespace :user do
    resources :products, only: %i[index show]
    resources :orders, only: %i[index create]
  end
  get '/search', to: 'admin/admin_products#search'
  get '/shirts', to: 'admin/admin_products#shirts'
  get '/trousers', to: 'admin/admin_products#trousers'
  get '/shoes', to: 'admin/admin_products#shoes'
  get '/u-search', to: 'user/products#search'
  get '/u-shirts', to: 'user/products#shirts'
  get '/u-trousers', to: 'user/products#trousers'
  get '/u-shoes', to: 'user/products#shoes'
  get '/admin', to: 'user/products#verify_admin'
  get '/your_history', to: 'user/orders#customer_orders'
  get '/admin/sizes', to: 'admin/admin_products#sizes', constraints: ->(request) { request.xhr? }
  root 'user/products#index'
=======
  end
>>>>>>> Stashed changes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
