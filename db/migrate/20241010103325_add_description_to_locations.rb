class AddDescriptionToLocations < ActiveRecord::Migration[7.1]
  def change
    add_column :locations, :description, :string
  end
end
