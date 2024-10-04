class RemoveLocationFromCharacters < ActiveRecord::Migration[7.1]
  def change
    remove_column :characters, :location, :string
  end
end
