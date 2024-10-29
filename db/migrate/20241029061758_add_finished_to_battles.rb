class AddFinishedToBattles < ActiveRecord::Migration[7.1]
  def change
    add_column :battles, :finished, :boolean
  end
end
