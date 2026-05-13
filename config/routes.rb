Rails.application.routes.draw do
  devise_for :users

  root "home#index"
  resources :items, only: %i[index show]
  resources :tasks, only: %i[index show]
  resources :deficit_items, only: %i[index]
  patch "user_items", to: "user_items#update", as: :user_item
  patch "user_tasks", to: "user_tasks#update", as: :user_task

  namespace :admin do
    root "dashboard#index"
    get "dashboard", to: "dashboard#index"
    resources :items, only: %i[index edit update]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end