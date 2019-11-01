class VideogamesController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
      @videogames = Videogame.all
  end

  def show
  id = params[ :id]
  @videogame = Videogame.find(id)
  @profile = current_user.profile
end

  def new
    @videogame = Videogame.new
  end

def create
  @videogame = Videogame.new ( videogame_params )
 
  @profile = current_user.profile
  if @videogame.save 
    ProfileVideogame.create(videogame_id: @videogame.id, profile_id: @profile.id, role: "uploader")


    
    redirect_to root_path


  else
    render :new
  end
end
 

  def edit
  end

  def install
    @profile = current_user.profile
    @videogame = Videogame.find_by_id(params[:id]) 
    @profile_videogame = ProfileVideogame.create(videogame_id: @videogame.id, profile_id: @profile.id, role: "downloader")

    if @profile_videogame.save 

      redirect_to videogame_path
    end
  end


  def update
      #finsih logic for updating the record
  end

  def destroy
      #finish logic for deleting the record
  end

  private

  def videogame_params  
  params.require(:videogame).permit(:name, :release_date, :average_rating, :genre_id, :developer_id, :description, :system_req) 
  end
    
     
  def set_listing
    id = params[:id]
      
    @profiles= Profile.find(id)

    end
 
   def set_user_listing
     id = params[:id]
     @profile = current_user.profile
 
   end
 
 end