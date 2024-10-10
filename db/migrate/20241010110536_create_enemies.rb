class CreateEnemies < ActiveRecord::Migration[7.1]
  def change
    create_table :enemies do |t|
      t.string :type
      t.string :name
      t.integer :health
      t.integer :attack
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
