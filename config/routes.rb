Rails.application.routes.draw do
  get 'items/index'
  root to: "items#index"
  resources :items, only:[:index, :new, :create]
  devise_for :users
end
