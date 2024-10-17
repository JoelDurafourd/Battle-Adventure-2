class BattlesController < ApplicationController

  def new
    @user = current_user
    @character = set_character
  end

  def create
    @user = current_user
    @character = set_character
    @battle = Battle.new(battle_params)
    if @battle.save
      redirect_to user_battles_path(current_user), notice: 'Battle was successfully created.'
    else
      render :new
    end
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end
end
