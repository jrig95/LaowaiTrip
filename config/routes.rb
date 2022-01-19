Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :update
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :places do
    resources :bookings, only: [:new, :create]
    resources :wishlists, only: [:new, :create]
  end
  resources :wishlists, only: [:destroy]
  get 'profile', to: 'pages#profile', as: "profile"


  # get 'users/:id/new', to: 'pages#profile', as: :edit_user
end
