class CharactersController < ApplicationController

  def show
    @character = set_character
    @location = @character.location
    @enemies = Enemy.where(location: @location.id)
  end

  def index
    @characters = Character.all
    @user = current_user
  end

  def new
    @user = current_user
    @character = Character.new
  end

  def create
    starting_location = Location.create(name: "starting", description: "You wake up naked and afraid in a new land, with nothing to defend yourself but your fists")
    @character = Character.new(user_id: current_user.id, name: params[:character][:name], health: 100, hunger: 100, attack: 1, location: starting_location)
    if @character.save
      Enemy.create_chicken(starting_location)
      redirect_to user_characters_path(current_user), notice: 'Character was successfully created.'
    else
      render :new
    end
  end

  def travel
    @character = set_character
    @character.location.destroy
    @character.location = randommize_location
    redirect_to user_character_path(params[:user_id], params[:id])
  end

  def randommize_location
    possible_locations = [Location.create_meadow, Location.create_woods]
    return possible_locations.sample
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:user_id, :name, :health, :hunger, :attack, :location)
  end
end
