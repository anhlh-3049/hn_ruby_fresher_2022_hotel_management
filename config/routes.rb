Rails.application.routes.draw do
  root "static_pages#index"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get  "/logout", to: "sessions#destroy"

  resources :users
  resources :booking_rooms, only: :index

  namespace :admin do
    root "dash_broads#index"

    resources :dash_broads, only: :index
    resources :rooms
    resources :room_views
    resources :booking_rooms
  end
end
