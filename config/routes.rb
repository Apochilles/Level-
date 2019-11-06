Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'my', controllers: {
  sessions: 'user/sessions',
  registrations: "user/registrations"
}
  get "/", to: "pages#home", as: "root"

  
  get "/videogames", to: "videogames#index", as: "videogames"
  post "/videogames", to: "videogames#create" 
  get "/videogames/new", to: "videogames#new", as: "new_videogame"
  get "/videogames/:id/edit", to: "videogames#edit", as: "edit_videogame"
  delete "/videogames/:id", to: "videogames#destroy"
  get "/videogames/:id", to: "videogames#show", as: "videogame"
  get "/videogames/:id", to: "videogames#update"
  post "/videogames/:id", to: "videogames#update"
  get "/videogames/:id/install", to: "videogames#install", as: "install_videogame"



  post "/profiles", to: "pages#create" 
  get "/profiles/:id", to: "pages#show", as: "profile"
  get "/profiles/:id/new", to: "pages#new", as: "new_listing"
  get "/profiles/:id/edit", to: "pages#edit", as: "edit_listing"
  patch "/profiles/:id", to: "pages#update"
  delete "/profiles/:id", to: "profiles#destroy", as: "destroy_listing"
  get "/profiles/:id", to: "pages#update"
  patch "/profiles/:id", to: "pages#update"

  


  get "*path", to: "pages#not_found"
end

  

