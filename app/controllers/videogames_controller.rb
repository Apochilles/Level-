class VideogamesController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

 #This method when called creates a instance variable and stores all my Videogames inside it and sorts them by name (ascending) 
  def index
      @videogames = Videogame.all.order("name")
  end


  #This method finds a video game by id and connects it with the current user.profile to determine what privileges the user will have in the show page. 

  def show
  id = params[ :id]
  @videogame = Videogame.find(id)
  @profile = current_user.profile
end

  #This method creates new instance of a videogame object, stores it in a videogame instance variable and permits fields as allowed by videogame_params. It then identifies which profile is currently logged in so it can assign that profile_id and the role "uploader" to the join table with the new videogame_id. If the information is invalid it reloads the form otherwise it creates a Videogame and redirects the user to the videogame index page

  def new
    @videogame = Videogame.new
  end


def create
  @videogame = Videogame.new ( videogame_params )
 
  @profile = current_user.profile
  if @videogame.save 
    ProfileVideogame.create(videogame_id: @videogame.id, profile_id: @profile.id, role: "uploader")
    
    redirect_to videogames_path
 
  else
    render :new
  end
end
 
#This method finds the video game that corresponds to the correct :id and removes it from the database before returning the user to the index page 

  def destroy
    Videogame.find(params[:id]).destroy
    
    redirect_to videogames_path
  end
    
#This method finds a video game by id and connects it with the current user.profile and stores those two variables inside the profile_videogame table with assigned role "downloader" then redirects the user to the index page 

  def install
    @profile = current_user.profile
    @videogame = Videogame.find_by_id(params[:id]) 
    @profile_videogame = ProfileVideogame.create(videogame_id: @videogame.id, profile_id: @profile.id, role: "downloader")
  
   
      redirect_to videogame_path
  end


  #This method finds a video game by id and allows the user to edit permited fields as allowed by videogame_params. If the information is invalid it reloads the form otherwise it updates and redirects the user to the videogame index page


  def update
    videogame_params = params.require(:videogame).permit(:name, :release_date, :average_rating, :genre_id, :developer_id, :description, :system_req, :picture) 
    id = params[:id]
      @videogame  = Videogame.find(id)
      if @videogame.update(videogame_params)
        redirect_to videogames_path
      else
        render :edit
      end
  
  end


  private

   #This method determines what fields are permitted when creating or editing a videogame. 

  def videogame_params  
  params.require(:videogame).permit(:name, :release_date, :average_rating, :genre_id, :developer_id, :description, :system_req, :picture) 
  end
    
   #This method determines the current id of the video game when on the show or edit page.
  
  def set_listing
    id = params[:id]
      
    @videogame = Videogame.find(id)

  end
 
     #This method determines the current id of the video game when on the show or edit page and determines what user is associated to it. 

   def set_user_listing
     id = params[:id]
     @profile = current_user.profile
 
   end
 
 end