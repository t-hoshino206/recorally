class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :name, null: false
      t.string :menu, null: false
      t.integer :prefecture_id, null: false
      t.string :address, null: false
      t.string :map
      t.references :card, null: false, foreign_key: true
      t.timestamps
    end
  end
end
