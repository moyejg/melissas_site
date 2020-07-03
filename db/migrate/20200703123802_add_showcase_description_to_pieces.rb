class AddShowcaseDescriptionToPieces < ActiveRecord::Migration[6.0]
  def change
    add_column :pieces, :showcase_description, :text
  end
end
