class Location < ApplicationRecord
  belongs_to :character
  has_many :enemies, dependent: :destroy

  def self.create_meadow(character)
    meadow = Location.create(character_id: character.id, name: "meadow", description: "You arrive in a clear meadow, in the distance you see some trees, but everything around you is in sight.")
    Enemy.create_chicken(meadow)
    Enemy.create_goblin(meadow)
    return meadow
  end

  def self.create_woods(character)
    woods = Location.create(character_id: character.id, name: "woods", description: "You arrive in the dark woods, where visibility is low and danger lurks behind the trees.")
    Enemy.create_goblin(woods)
    return woods
  end

end
