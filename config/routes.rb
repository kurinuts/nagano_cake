Rails.application.routes.draw do
  
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  
  resources :admins
  resources :customers
  get 'orders_details/new'
  get 'orders_details/index'
  get 'orders_details/show'
  get 'orders_details/edit'
  get 'orders/new'
  get 'orders/index'
  get 'orders/show'
  get 'orders/edit'
  get 'cart_items/new'
  get 'cart_items/index'
  get 'cart_items/show'
  get 'cart_items/edit'
  get 'genres/new'
  get 'genres/index'
  get 'genres/show'
  get 'genres/edit'
  get 'items/new'
  get 'items/index'
  get 'items/show'
  get 'items/edit'
  # get 'admins/new'
  # get 'admins/index'
  # get 'admins/show'
  # get 'admins/edit'
  # get 'addresses/new'
  # get 'addresses/index'
  # get 'addresses/show'
  # get 'addresses/edit'
  # get 'customers/new'
  # get 'customers/index'
  # get 'customers/show'
  # get 'customers/edit'
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
