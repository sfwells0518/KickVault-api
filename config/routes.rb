Rails.application.routes.draw do
  get "/ipad_pro", controller: "products", action: "show_ipad"
  get "/macbook_pro", controller: "products", action: "show_macbook"
  get "/iphone_14_pro", controller: "products", action: "show_iphone_14_pro"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
