class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :health
      t.integer :hunger
      t.integer :attack
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
