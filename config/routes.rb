Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
    # passwords: 'admin/passwords',
    # registrations: 'admin/registrations'
  }

  namespace :admin do
    resources :items
    # resources :sessions
    get "homes" => "homes#top", as: "homes"
    resources :genres
    resources :customers
    resources :orders
    resources :order
    patch 'orders/:id/order_details' => 'orders_details#update', as: 'order_detail'
    get 'customer/views/:id' => 'customer#views'
  end

  scope module: :public do
    resources :items
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    get 'unsubscribe' => 'customers#unsubscribe', as: 'customer_unsubscribe'
    patch 'withdraw/:id' => 'customers#withdraw', as: 'withdraw_customer'
    put 'withdraw/:id' => 'customers#withdraw'

    # resources :homes
    # resources :registrations
    # resources :sessions
    resources :customers
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items
    resources :orders
    resources :addresses
  end

  # resources :items
  # resources :customers

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
  root to: "public/homes#top"
  get 'public/homes/about' => 'public/homes#about', as: "about"
  # post 'sessions/admin' => 'admin/sessions'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
