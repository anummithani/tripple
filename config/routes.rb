Rails.application.routes.draw do
  resources :sights
  resources :trip_photos
  resources :restaurants
  resources :travelers
  resources :trips
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
