class VideogamesController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
      @videogames = Videogame.all
  end

  def show
#   id = params[ :id]
#   @Videogame = current_user.videogames.find_by_id(id)
end

  def new
    @videogame = Videogame.new
  end

  def create
      #finish logic for creating a record
  end

  def edit
  end

  def update
      #finsih logic for updating the record
  end

  def destroy
      #finish logic for deleting the record
  end

  private

  def videogame_params  
  params.require(:videogame).permit(:name, :release_date, :average_rating, :profile_id, :genre_id, :developer_id )  
  end
    
  def set_listing
    id = params[:id]
      @videogames= Videogame.find(id)
   
    end
def set_user_listing
    id = params[:id]
    @videogame = current_user.videogames.find_by_id(id)

    if @videogame == nil
        redirect to videogames_path
    end
 end


end
