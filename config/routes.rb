Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get "/forecast", to: "forecast#index"
      get "/backgrounds", to: "backgrounds#index"
      get "/book-search", to: "books#index"
      get "/breweries", to: "breweries#index"
      post "/users", to: "users#create"
      post "/sessions", to: "users#login"
      post "/road_trip", to: "roadtrip#create"
    end
  end
end
