Socialfeeds::Application.routes.draw do
  root to: "sessions#new"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy", :as => "logout"
  get "/groups/index", to: "groups#index",:as => "index_group"
  get "/groups/new", to: "groups#new",:as =>"new_group"
end
