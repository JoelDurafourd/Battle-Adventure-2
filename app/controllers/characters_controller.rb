class CharactersController < ApplicationController

  def show
    @character = set_character
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
    @character = Character.new(user_id: current_user.id, name: params[:character][:name], health: 100, hunger: 100, attack: 1, location: Location.new(name: "starting"))
    if @character.save
      redirect_to user_characters_path(current_user), notice: 'Character was successfully created.'
    else
      render :new
    end
  end

  def travel
    @character = Character.find(params[:id]) # Find the character
    new_location_params = location_params # Strong parameters for location creation

    if @character.travel_to(new_location_params)
      redirect_to @character, notice: 'Successfully traveled to new location.'
    else
      redirect_to @character, alert: 'Failed to travel to new location.'
    end
  end

  private

  def location_params
    # Adjust these parameters based on your Location model's attributes
    params.require(:location).permit(:name, :description, :enemy_ids, :item_ids)
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:user_id, :name, :health, :hunger, :attack, :location)
  end
end
