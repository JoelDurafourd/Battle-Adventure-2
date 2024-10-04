class LocationsController < ApplicationController

  def new
    @user = current_user
    @character = set_character
    @location = Location.new
  end

  def create
    @location = Location.new(user_id: current_user.id, name: params[:location][:name], health: 100, hunger: 100, attack: 1, location: "starting")
    if @location.save
      redirect_to user_locations_path(current_user), notice: 'Location was successfully created.'
    else
      render :new
    end
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end
end
