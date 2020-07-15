class RenameTypeToPieceType < ActiveRecord::Migration[6.0]
  def change
    rename_column :pieces, :type, :piece_type
  end
end
