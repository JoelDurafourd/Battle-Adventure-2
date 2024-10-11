class Location < ApplicationRecord
  belongs_to :character
  has_many :enemies, dependent: :destroy

  def self.create_meadow
    meadow = Location.create(name: "meadow", description: "You arrive in a clear meadow, in the distance you see some trees, but everything around you is in sight.")
    location_enemies = [Enemy.create_chicken(meadow), Enemy.create_goblin(meadow)]
    max_enemies = 2
    return meadow
  end

  def self.create_woods
    woods = Location.create(name: "woods", description: "You arrive in the dark woods, where visibility is low and danger lurks behind the trees.")
    Enemy.create_goblin(woods)
    Enemy.create_goblin(woods)
    return woods
  end

  def create_location_enemies(max_enemies, location_enemies)
    (1..max_enemies)
  end

end
