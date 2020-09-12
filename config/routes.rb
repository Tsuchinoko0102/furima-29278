Rails.application.routes.draw do
  get 'items/index'
  root to: "items#index"
  resources :items
  devise_for :users
end
