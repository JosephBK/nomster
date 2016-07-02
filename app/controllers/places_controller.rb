class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    puts params
    if params[:q]
      @places=Place.where('name ilike ?',"%#{params[:q]}%")
    else
      @places=Place.all
    end
  end

  def new
    @place = Place.new
  end

  def create
  @place = current_user.places.create!(place_params)
  if @place.invalid?
    flash[:error] ='<strong>Descriptions must be 3 to 140 characters long</strong>'
    render :new 
  else    
  redirect_to root_path
  end
  end
  def show
    @place = Place.find(params[:id])  
  end
  def edit
    @place = Place.find(params[:id])
  end
  def update
    @place = Place.find(params[:id])
    @place.update_attributes(place_params)
    redirect_to root_path
  end

  private

  def place_params
  params.require(:place).permit(:name, :description, :address)
  end
end
