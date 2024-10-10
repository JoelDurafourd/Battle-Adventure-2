class Enemy < ApplicationRecord
  belongs_to :location

  def self.create_chicken
    Enemy.create(name: "chicken", type: "farm_animal", description: "a chicken gone mad and attacking the first person he sees", health: 5, attack: 1)
  end

  def self.create_goblin
    Enemy.create(name: "goblin", type: "greenskin", description: "a green icky creature", health: 50, attack: 1)
  end
end
