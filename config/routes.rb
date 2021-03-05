Rails.application.routes.draw do
  devise_for :users

  root to: 'items#index'

  resources :items, only: [:index, :new, :create]
  post 'items/new', to: 'items#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
