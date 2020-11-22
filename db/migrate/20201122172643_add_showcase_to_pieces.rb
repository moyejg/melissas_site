class AddShowcaseToPieces < ActiveRecord::Migration[6.0]
  def change
    add_column :pieces, :showcase, :boolean, default: false
  end
end
