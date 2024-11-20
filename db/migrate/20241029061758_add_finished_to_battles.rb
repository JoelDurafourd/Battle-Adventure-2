class AddFinishedToBattles < ActiveRecord::Migration[7.1]
  def change
    add_column :battles, :finished, :boolean, default: false
  end
end
