Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }

  namespace :admin do
    resources :items
    resources :sessions
    resources :homes
    resources :genres
    resources :customers
    resources :orders
    resources :order
  end

  scope module: :public do
    resources :items
    resources :homes
    resources :registrations
    resources :sessions
    resources :customers
    resources :cart_items
    resources :orders
    resources :addresses
  end

  resources :items
  resources :customers
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
