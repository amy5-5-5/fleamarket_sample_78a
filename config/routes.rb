Rails.application.routes.draw do
  devise_for :users
  root 'items#index'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'items/purchase' => "items#purchase"


  #ユーザー管理、マイページ実装用（onlyで必要な機能だけ！

  get 'users/show' => 'users#show'
  get 'users/log-out' => 'users#logout'
  get 'users/creditcard' => 'users#creditcard'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :items
  
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

end
