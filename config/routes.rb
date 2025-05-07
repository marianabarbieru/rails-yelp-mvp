Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  resources :restaurants do
    collection do
      get :top
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "restaurants", to: "restaurants#index"

  # Routes for adding a new restaurant
  get "restaurants/new", to: "restaurants#new"
  post "restaurants", to: "restaurants#create"

  # Route to show details of a restaurant (including reviews)
  get "restaurants/:id", to: "restaurants#show"

  # Routes for adding a new review to a specific restaurant
  get "restaurants/:id/reviews/new", to: "reviews#new"
  post "restaurants/:id/reviews", to: "reviews#create"

end
