class AddAliveToEnemies < ActiveRecord::Migration[7.1]
  def change
    add_column :enemies, :alive, :boolean
  end
end
