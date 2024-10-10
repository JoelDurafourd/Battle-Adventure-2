class Location < ApplicationRecord
  belongs_to :character
  has_many :enemies

  def self.create_meadow
    Location.create(name: "meadow", description: "You arrive in a clear meadow, in the distance you see some trees, but everything around you is in sight.")
  end

  def self.create_woods
    Location.create(name: "woods", description: "You arrive in the dark woods, where visibility is low and danger lurks behind the trees.")
  end

end
