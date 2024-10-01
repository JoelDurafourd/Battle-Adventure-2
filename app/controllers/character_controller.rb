class CharacterController < ApplicationController

  def new
    @user = current_user
    @character = Character.new
  end

  def create
    @character = Character.new(user: current_user, name: @character, health: 100, hunger: 100, attack:, 1, location: "starting")
    if @note.save
      redirect_to user_character_notes_path(current_user, @character), notice: 'Character was successfully created.'
    else
      render :new
    end
  end

  private

  def character_params
    params.require(:character).permit(:user_id, :name, :health, :hunger, :attack, :location)
  end
end
