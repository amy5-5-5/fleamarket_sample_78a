Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  #ユーザー管理、マイページ実装用（onlyで必要な機能だけ！

  get 'users/show' => 'users#show'
  get 'users/log-out' => 'users#logout'
  get 'users/creditcard' => 'users#creditcard'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items do
    collection do
      get 'get_category_children', defaults: { fomat: 'json'}
      get 'get_category_grandchildren', defaults: { fomat: 'json'}
    end
  end
end
