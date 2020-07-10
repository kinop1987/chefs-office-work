Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions/#create'
    delete 'logout', to: 'devise/sessions#destroy' 
  end
end
