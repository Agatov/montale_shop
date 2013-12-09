Shop::Application.routes.draw do

  root to: 'items#index'
  get '/montale', to: 'items#index'
  get ':brand_name/:item_name', to: 'items#show'

  namespace :admin do
    resources :items
    resources :volumes
    resources :brands
  end

  resources :items, only: [:index, :show]

  resource :cart, only: [:show, :create] do
    get :clear, on: :collection
    post :remove, on: :collection
  end

  resource :orders, only: :create do
    post :fast, on: :collection
  end
end
