Rails.application.routes.draw do
  devise_for :users

  root "home#index"
  resources :items, only: %i[index show]
  resources :tasks, only: %i[index show]
  patch "user_items", to: "user_items#update", as: :user_item

  namespace :admin do
    root "dashboard#index"
    get "dashboard", to: "dashboard#index"
  end
end