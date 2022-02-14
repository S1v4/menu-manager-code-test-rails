Rails.application.routes.draw do
  root "restaurants#index"
  resources :restaurants, only: [:index, :create]
  resources :menus, only: [:index, :new, :create]
  resources :dishes, only: [:new, :create]
end
