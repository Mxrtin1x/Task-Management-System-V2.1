Rails.application.routes.draw do
  # Use a single `devise_for` call to define custom controllers for sessions and registrations
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }

  # Redirect root URL based on authentication status
  authenticated :user do
    root to: "tasks#index", as: :authenticated_root
  end
  unauthenticated do
    root to: redirect("/users/sign_in")
  end

  # Tasks CRUD routes
  resources :tasks

  # Keep the home route if you still need it for other purposes
  # get "home/index", to: "home#index", as: "home_index"
end
