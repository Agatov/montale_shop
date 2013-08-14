Shop::Application.routes.draw do
  namespace :admin do
    resources :items
    resources :volumes
  end
end
