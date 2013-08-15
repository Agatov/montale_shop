Shop::Application.routes.draw do

  root to: 'items#index'

  namespace :admin do
    resources :items
    resources :volumes
  end

  resources :items, only: [:index, :show]

  resource :cart, only: [:show, :create] do
    get :clear, on: :collection
    post :remove, on: :collection
  end

  resource :orders, only: :create
end
