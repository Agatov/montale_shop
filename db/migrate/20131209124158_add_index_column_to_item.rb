class AddIndexColumnToItem < ActiveRecord::Migration
  def change
    add_column :items, :index, :string
  end
end
