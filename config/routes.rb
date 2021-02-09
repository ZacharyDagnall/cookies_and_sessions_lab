Rails.application.routes.draw do
  #resources :products
  root to: "products#index", as: "root"
  get "/products", to: "products#index", as: "products"
  post "/products", to: "products#add", as: "add"
end
