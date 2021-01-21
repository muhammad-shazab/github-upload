Rails.application.routes.draw do
  devise_for :customers
  resources :products do
    member do
      patch :buy
    end    
  end
  resources :variants,:users,:orders
  get '/search' ,to: 'products#search'
  get '/shirts' ,to: 'products#shirts'
  get '/trousers' ,to: 'products#trousers'
  get '/shoes' ,to: 'products#shoes'
  get '/u-search' ,to: 'users#search'
  get '/u-shirts' ,to: 'users#shirts'
  get '/u-trousers' ,to: 'users#trousers'
  get '/u-shoes' ,to: 'users#shoes'
  get '/admin',to: 'users#verify_admin'
  get '/your_history',to: 'orders#customer_orders'
  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
