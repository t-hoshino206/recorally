class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :category, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
