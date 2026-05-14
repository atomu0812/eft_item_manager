Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in", as: :users_guest_sign_in
  end

  root "home#index"
  get "guide", to: "guides#show", as: :guide
  get "guest_guide", to: "guest_guides#show", as: :guest_guide
  get "terms", to: "static_pages#terms", as: :terms
  get "privacy", to: "static_pages#privacy", as: :privacy

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