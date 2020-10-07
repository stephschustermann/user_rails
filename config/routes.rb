Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  get "users/:id", to: "users#index"
  resource :users
end
