Socialfeeds::Application.routes.draw do
  root to: "sessions#new"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy", :as => "logout"
  get "/create", to: "sessions#create", :as => "feeds"
  resources :groups
end
