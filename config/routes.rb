Rails.application.routes.draw do
  root to: "profiles#index"
  # get 'messages/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :uesrs, only: [:index, :new, :create,:delete, :show]
  resources :profiles
  resources :rooms, only: [:new, :create, :destroy, :index] do
  resources :messages, only: [:index, :create]
  end
end
