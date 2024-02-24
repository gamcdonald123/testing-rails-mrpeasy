Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "customers#index"
  resources :customers do
    # Nested resources for orders if you need to list orders by customer or create new orders in the context of a customer
    resources :orders, only: [:index, :new, :create]
  end

  # Non-nested routes for Orders and OrderItems
  resources :orders, except: [:index, :new, :create] do
    resources :order_items, except: [:show, :index] # Adjust according to your needs
  end

end
