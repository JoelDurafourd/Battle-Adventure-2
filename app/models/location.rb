class Location < ApplicationRecord
  belongs_to :character
  has_many :enemies, dependent: :destroy

  def self.enemy_type_converter(enemy_type, location)
    case enemy_type
      when "chicken"
        Enemy.create_chicken(location)
      when "goblin"
        Enemy.create_goblin(location)
    end
  end

  def self.create_meadow
    meadow = Location.create(name: "meadow", description: "You arrive in a clear meadow, in the distance you see some trees, but everything around you is in sight.")
    enemy_types = ["chicken", "goblin"]
    max_enemies = 2
    max_enemies.times do
      enemy_type_converter(enemy_types.sample, meadow)
    end
    return meadow
  end

  def self.create_woods
    woods = Location.create(name: "woods", description: "You arrive in the dark woods, where visibility is low and danger lurks behind the trees.")
    return woods
  end

end
