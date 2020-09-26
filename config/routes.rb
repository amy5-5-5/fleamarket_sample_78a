Rails.application.routes.draw do
  root 'items#index'
  resources :items, except: [:index, :show]
  get '/items/show', to: 'items#show'
end
