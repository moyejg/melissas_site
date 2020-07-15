class AddFrameToPieces < ActiveRecord::Migration[6.0]
  def change
    add_column :pieces, :frame, :boolean, default: false
  end
end
