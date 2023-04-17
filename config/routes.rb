Rails.application.routes.draw do
  # Product Routes:
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  # User Routes:
  post "/users" => "users#create"

  # Session Routes:
  post "/sessions" => "sessions#create"
end
