class AddPreviewToItem < ActiveRecord::Migration
  def change
    add_column :items, :preview, :string
  end
end
