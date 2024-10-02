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
    @character = Character.new(user: current_user, name: params[:name], health: 100, hunger: 100, attack: 1, location: "starting")
    if @character.save
      redirect_to user_characters_path(current_user), notice: 'Character was successfully created.'
    else
      render :new
    end
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end

  def character_params
    params.require(:character).permit(:user_id, :name, :health, :hunger, :attack, :location)
  end
end
