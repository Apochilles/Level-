Rails.application.routes.draw do
  # devise_for :users
  get "/", to: "videogames#index", as: "root"
  
  post "/videogames", to: "videogames#create"
  get "/videogames/new", to: "videogames#new", as: "new_videogame"

end
