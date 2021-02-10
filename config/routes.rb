Rails.application.routes.draw do
  # get 'events/index'
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:show, :edit, :update]
  resources :rooms, only: [:new, :create, :destroy] do
    resources :memos, only: [:index, :create]
  end
  resources :events
end
