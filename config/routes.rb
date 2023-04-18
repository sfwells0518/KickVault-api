Rails.application.routes.draw do
  # Product Routes:
  get "/products" => "products#index" # everybody
  get "/products/:id" => "products#show" # everybody
  post "/products" => "products#create" # admin
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  # User Routes:
  post "/users" => "users#create" # everybody

  # Session Routes:
  post "/sessions" => "sessions#create" # everybody

  # Order Routes:
  post "/orders" => "orders#create" # logged in users
  get "/orders/:id" => "orders#show" # logged in users
  get "/orders" => "orders#index" # logged in users
end

# people not logged in (everybody)
# people logged in (users)
# admin (admin)
