Rails.application.routes.draw do
  root "home#index"

#  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get "/auth/github/callback", to: "github#create"
#  get "/auth/google_oauth2/callback", to: "google#create"
  get '/auth/:provider/callback' => 'sessions#omniauth'
  get "/dashboard", to: "dashboard#show"
end
