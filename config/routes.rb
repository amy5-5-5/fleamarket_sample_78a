Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  #ユーザー管理、マイページ実装用（onlyで必要な機能だけ！）
  resources :users
  get    'users/:id'   =>  'users#show'
  get '/mypage' => 'users#mypage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
