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

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end
end
