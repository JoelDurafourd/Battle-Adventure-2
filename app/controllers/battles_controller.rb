class BattlesController < ApplicationController

  def create
    @character = set_character
    @enemy = 
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end
end
