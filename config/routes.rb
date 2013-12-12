Shop::Application.routes.draw do

  namespace :admin do
    resources :items do
      resources :prices
    end

    resources :brands
  end

  namespace :crm do
    resources :orders
  end

  root to: 'items#index'
  get '/montale', to: 'items#index'
  get ':brand_name/:item_name', to: 'items#show'

  resources :items, only: [:index, :show]

  resource :cart, only: [:show, :create] do
    get :clear, on: :collection
    post :remove, on: :collection
  end

  resource :orders, only: :create do
    post :fast, on: :collection
  end
end
