class BattlesController < ApplicationController


  def new
    @user = current_user
    @character = set_character
  end

  def create
    @character = set_character
    @user = current_user
    raise
    @battle = Battle.create(user_id: params[:user_id], character_id: params[:character_id])
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end
end
