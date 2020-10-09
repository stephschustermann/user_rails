Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resource :users
  get "users/:id", to: "users#index"
  devise_scope :user do
    post "sign_in", to: "sessions#create"
    delete "sign_out", to: "sessions#destroy"
  end
end
