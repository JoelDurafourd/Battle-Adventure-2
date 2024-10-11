class RemoveTypeFromEnemy < ActiveRecord::Migration[7.1]
  def change
    remove_column :enemies, :type, :string
  end
end
