Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "food/(:status)", to: "vendor#food"
      get "truck/(:status)", to: "vendor#truck"
      get "carts/(:status)", to: "vendor#carts"
    end
  end
end