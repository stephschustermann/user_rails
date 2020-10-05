Rails.application.routes.draw do
  get "users/:id", to: "users#index"
  resource :users
end
