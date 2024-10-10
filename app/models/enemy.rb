class Enemy < ApplicationRecord
  belongs_to :location

  def self.create_chicken
    Enemy.create(name: "chicken", type: "farm_animal", health: 5, attack: 1)
  end

  def self.create_goblin
    Enemy.create(name: "goblin", type: "greenskin", health: 50, attack: 1)
  end
end
