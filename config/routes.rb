Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"

  resources :users do
    resources :memos 
  end

  resources :suppliers
end
