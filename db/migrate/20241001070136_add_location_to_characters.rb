class AddLocationToCharacters < ActiveRecord::Migration[7.1]
  def change
    add_column :characters, :location, :string
  end
end
