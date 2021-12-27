Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :places do
    resources :bookings, only: [:new, :create, :destroy]
    resources :wishlists, only: [:new, :create, :destroy]
  end
  get 'profile', to: 'pages#profile'
end
