class Location < ApplicationRecord
  belongs_to :character

  def self.create_meadow
    Location.create(name: "meadow")
  end

  def self.create_woods
    Location.create(name: "woods")
  end

end
