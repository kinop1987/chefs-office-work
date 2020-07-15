Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"

  resources :users do
    resources :memos 
    resources :calculations
    resources :carenders
  end

  resources :suppliers do
    resources :orders
  end



end
