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

  # Order Routes:
  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"
  get "/orders" => "orders#index"
end

# people not logged in
# people logged in
# employees/admin ---> authorization/permissions
