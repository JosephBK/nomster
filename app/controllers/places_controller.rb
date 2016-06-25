class PlacesController < ApplicationController

  def index
    @places=Place.all
  end

  def new
    @place = Place.new
  end

  def create
  @place = Place.create(place_params)
  if @place.invalid?
    flash[:error] ='<strong>Descriptions must be 3 to 140 characters long</strong>'
     render :new 
  else    
  redirect_to root_path
  end
  end

  private

  def place_params
  params.require(:place).permit(:name, :description, :address)
  end
end
