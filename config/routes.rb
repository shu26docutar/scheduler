Rails.application.routes.draw do
  get 'events/index'
  devise_for :users
  root to: "rooms#index"
  resources :events, only: [:index, :new, :create]
  resources :rooms, only: [:new, :create] do
    resources :memos, only: [:index, :create]
  end
  
end
