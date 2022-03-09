Rails.application.routes.draw do
  root :to => "trips#index"
  resources :friend_requests
  resources :sights
  resources :trip_photos
  resources :restaurants
  resources :travelers
  resources :trips
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
