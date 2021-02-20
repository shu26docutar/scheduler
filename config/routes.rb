Rails.application.routes.draw do
  # get 'events/index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "rooms#index"
  resources :users, only: [:show, :edit, :update]
  resources :rooms, only: [:new, :create, :edit, :update, :destroy] do
    resources :memos, except: :new
  end
  resources :events
end
