Socialfeeds::Application.routes.draw do
  root to: "sessions#new"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy", :as => "logout"
  resources :groups
end
