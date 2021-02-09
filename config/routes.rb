# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :customers
  devise_for :operators

  namespace :admin do
    resources :variants, only: :create do
      member do
        patch :buy
      end
    end
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

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
