class AddPieceTypeToPieces < ActiveRecord::Migration[6.0]
  def change
    add_column :pieces, :piece_type, :string
  end
end
