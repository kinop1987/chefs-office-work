Rails.application.routes.draw do
  devise_for :suppliers, controllers: {
    sessions:      'suppliers/sessions',
    passwords:     'suppliers/passwords',
    registrations: 'suppliers/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  root to: "top#index"

  resources :users do
    get "/suppliers", to: "users#suppliers"
    resources :memos 
    resources :calculations
    resources :calendars
    get "orders", to: "orders#index"
    get "orders/new/:supplier_id", to: "orders#new"
    post "orders/:supplier_id", to: "orders#create" 
    post "orders/:supplier_id/confirm", to: "orders#confirm"
    get "orders/:order_id/show",to: "orders#show"
    get "orders/group/:delivery_date", to: "orders#group"
    get "receipts", to: "receipts#index"
    get "receipts/group/:delivery_date", to: "receipts#group"
    get "receipts/:confirm_order_id", to: "receipts#show"
    post "receipts/:confirm_order_id", to: "receipts#create"

  end

  resources :suppliers do
   resources :products
   resources :confirm_orders
   get "confirm_orders/show/:order_id", to: "confirm_orders#show"
   post "confirm_orders/:order_id/confirm", to: "confirm_orders#confirm"
   post "confirm_orders/:order_id", to: "confirm_orders#create"
  end

  resources :notifications, only: :index

end
