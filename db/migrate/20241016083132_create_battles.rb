class CreateBattles < ActiveRecord::Migration[7.1]
  def change
    create_table :battles do |t|
      t.references :character, null: false, foreign_key: true
      t.references :enemy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
