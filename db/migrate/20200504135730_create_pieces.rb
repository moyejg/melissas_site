class CreatePieces < ActiveRecord::Migration[6.0]
  def change
    create_table :pieces do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
