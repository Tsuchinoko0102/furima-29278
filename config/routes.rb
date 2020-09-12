Rails.application.routes.draw do
  get 'items/index'
  root to: "items#index"
  resources :items, only:[:index, :new, :create, :show, :edit]
  devise_for :users
end
