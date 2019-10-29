Rails.application.routes.draw do
  devise_for :users
  get "/", to: "pages#home", as: "root"
  
  
  get "/videogames", to: "videogames#index", as: "videogames"
  post "/videogames", to: "videogames#create"
  get "/videogames/new", to: "videogames#new", as: "new_videogame"
  get "/videogames/:id", to: "videogames#show", as: "videogame"
end
