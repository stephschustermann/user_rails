Rails.application.routes.draw do
  devise_for :users
  get "users/:id", to: "users#index"
  resource :users
end
