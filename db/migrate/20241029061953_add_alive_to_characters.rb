class AddAliveToCharacters < ActiveRecord::Migration[7.1]
  def change
    add_column :characters, :alive, :boolean
  end
end
