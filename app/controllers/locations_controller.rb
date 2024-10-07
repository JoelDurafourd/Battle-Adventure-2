class LocationsController < ApplicationController

  def new
    @user = current_user
    @character = set_character
    @location = Location.new
  end

  def create
    @user = current_user
    @character = set_character
    @location = Location.new(location_params)
    if @location.save
      redirect_to user_locations_path(current_user), notice: 'Location was successfully created.'
    else
      render :new
    end
  end

  def meadow_location

  private

  def set_character
    @character = Character.find(params[:character_id])
  end

  def location_params
    params.require(:location).permit(:character_id, :name)
  end
end
