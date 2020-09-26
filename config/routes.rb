Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 最終的に消す。ビュー表示のために設定中
  root 'items#index'
  # except: [:show]は最終的に消す。ビュー表示のために設定中
  resources :items, except: [:index, :show]
end
