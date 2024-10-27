class BattlesController < ApplicationController

  def new
    @user = current_user
    @character = set_character
    @location = set_location
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

  def fight
    @user = current_user
    @character = set_character
    @location = set_location
    @enemy = @location.enemies.sample
    @battle = Battle.new(character_id: @character.id, enemy_id: @enemy.id)
    if @battle.save
      redirect_to user_character_battle_path(@user.id, @character.id, @battle.id), notice: 'Battle was successfully created.'
    else
      flash[:alert] = 'Error creating battle.'
      render :new
    end
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end

  def set_location
    @character = set_character
    @location = @character.location
  end
end
