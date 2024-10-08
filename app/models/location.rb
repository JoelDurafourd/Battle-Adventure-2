class Location < ApplicationRecord
  belongs_to :character

  def self.create_meadow
    Location.create(name: "meadow")
  end


end
