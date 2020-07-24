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
    resources :memos 
    resources :calculations
    resources :carenders
    get "orders", to: "orders#index"
    get "orders/new/:supplier_id", to: "orders#new"
    post "orders", to: "orders#create"
  end

  resources :suppliers do
   resources :products
  end

end
