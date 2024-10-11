class EnemiesController < ApplicationController
  def new
    @user = current_user
    @enemy = Enemy.new
  end

  def create
    @enemy = Enemy.new(type: params[:enemy][:type], name: params[:enemy][:name], health: 100, hunger: 100, attack: 1, location: set_location)
    @enemy.location = @location
    if @enemy.save
      redirect_to user_enemys_path(current_user), notice: 'Enemy was successfully created.'
    else
      render :new
    end
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end
end
