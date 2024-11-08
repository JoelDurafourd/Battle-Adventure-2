class BattlesController < ApplicationController
  def new
    @user = current_user
    @character = set_character
    @location = set_location
  end

  def show
    @user = current_user
    @character = set_character
    @battle = Battle.find(params[:id])
    @enemy = @battle.enemy
  end

  def attack_enemy
    @user = current_user
    @character = set_character
    @battle = Battle.find(params[:id])
    @enemy = @battle.enemy
    if [true, true, true, true, false].sample == true
      new_enemy_health = @enemy.health - @character.attack
      @enemy.health = new_enemy_health
      @enemy.save
    end
    if [true, true, true, true, false].sample == true
      new_character_health = @character.health - @enemy.attack
      @character.health = new_character_health
      @character.save
    end
    redirect_to user_character_battle_path(@user.id, @character.id, @battle.id), notice: 'Battle was successfully created.'
  end

  def create
    @user = current_user
    @character = set_character
    @battle = Battle.new(battle_params.merge(character_id: @character.id))

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
      redirect_to user_character_path(@user.id, @character.id), alert: 'Failed to create battle.'
    end
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end

  def set_location
    @character.location
  end

  def battle_params
    params.require(:battle).permit(:character_id, :enemy_id)
  end
end
