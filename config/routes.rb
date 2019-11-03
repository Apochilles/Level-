Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'my', controllers: {
  sessions: 'user/sessions',
  registrations: "user/registrations"
}
  
  
  
  
  get "/", to: "pages#home", as: "root"

  
  
  get "/videogames", to: "videogames#index", as: "videogames"
  post "/videogames", to: "videogames#create" 
  get "/videogames/new", to: "videogames#new", as: "new_videogame"
  get "/videogames/:id", to: "videogames#show", as: "videogame"


  get "/videogames/:id/install", to: "videogames#install", as: "install_videogame"
  
  get "/profiles/:id", to: "pages#show", as: "profile"
  get "/profiles/:id/new", to: "pages#new", as: "new_listing"
  get "/profiles/:id/edit", to: "pages#edit", as: "edit_listing"
  put "/profiles/:id", to: "pages#update"
  patch "/profiles/:id", to: "pages#update"

  get "*path", to: "pages#not_found"
end



