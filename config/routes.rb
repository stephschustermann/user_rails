Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "users", to: "endpoints#create"
  get "users", to: "endpoints#all"
  get "users/:id", to: "endpoints#findById"
end
