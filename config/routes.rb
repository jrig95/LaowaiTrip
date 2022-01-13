Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :users, only: %i[show]
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :places do
    resources :bookings, only: [:new, :create, :destroy]
    resources :wishlists, only: [:new, :create, :destroy]
  end
  get 'profile', to: 'pages#profile'

  # get 'users/:id/new', to: 'pages#profile', as: :edit_user
end
