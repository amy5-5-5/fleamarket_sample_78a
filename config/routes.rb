Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'
  #ユーザー管理、マイページ実装用（onlyで必要な機能だけ！

  get 'users/show' => 'users#show'
  get 'users/log-out' => 'users#logout'
  get 'users/creditcard' => 'users#creditcard'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items
end
