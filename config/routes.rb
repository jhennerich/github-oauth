Rails.application.routes.draw do
  root "home#index"

  get "/auth/github/callback", to: "github#create"
  get "/auth/google/callback", to: "google#create"
  get "/dashboard", to: "dashboard#show"
end
