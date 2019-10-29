class VideogamesController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
      @videogames = Videogame.all
  end

  def show
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

  def set_listing
      id = params[:id]
      @videogames= Videogame.find(id)
  end
end
