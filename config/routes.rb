Rails.application.routes.draw do
  devise_for :users

  root "home#index"
  resources :items, only: %i[index show]
  patch "user_items", to: "user_items#update", as: :user_item
end