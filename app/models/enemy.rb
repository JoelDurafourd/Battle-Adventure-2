class Enemy < ApplicationRecord
  belongs_to :location

  def self.create_chicken(location)
    Enemy.create(name: "chicken", description: "a chicken gone mad and attacking the first person it sees", health: 5, attack: 1, location_id: location.id)
  end

  def self.create_goblin(location)
    Enemy.create(name: "goblin", description: "a green icky creature", health: 50, attack: 1, location_id: location.id)
  end
end
