Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'
  get 'items/purchase' => "items#purchase"
  get 'users/show' => 'users#show'
  get 'users/log-out' => 'users#logout'
  get 'users/creditcard' => 'users#creditcard'
  resources :users

  resources :items do
    member do
      get :purchase
      get :pay
    end
    collection do
      get 'get_category_children', defaults: { fomat: 'json'}
      get 'get_category_grandchildren', defaults: { fomat: 'json'}
    end
  end

  resources :cards, only: [:new, :show, :create, :destroy] do
    collection do
      # post 'show', to: 'cards#show'
      # post 'pay', to: 'cards#pay'
      # post 'delete', to: 'cards#delete'
    end
  end

end