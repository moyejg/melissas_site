class RemoveTypeFromPieces < ActiveRecord::Migration[6.0]
  def change

    remove_column :pieces, :type, :string
  end
end
