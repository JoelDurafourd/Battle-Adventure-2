class Character < ApplicationRecord
  belongs_to :user
  has_one :location, dependent: :destroy

  # def travel_to(new_location_params)
  #   location.destroy # Optional: delete the old location
  #   self.location = Location.create(new_location_params)
  #   save
  # end
end
