Rails.application.routes.draw do
  # get 'events/index'
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:show, :edit, :update]
  resources :rooms, only: [:new, :create, :edit, :update, :destroy] do
    resources :memos, except: :new
  end
  resources :events
end
