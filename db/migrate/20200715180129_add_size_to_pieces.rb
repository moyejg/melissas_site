class AddSizeToPieces < ActiveRecord::Migration[6.0]
  def change
    add_column :pieces, :size, :string
  end
end
