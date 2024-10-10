class AddDescriptionToEnemies < ActiveRecord::Migration[7.1]
  def change
    add_column :enemies, :description, :string
  end
end
